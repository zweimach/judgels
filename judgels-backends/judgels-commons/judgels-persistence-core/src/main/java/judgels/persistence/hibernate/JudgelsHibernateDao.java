package judgels.persistence.hibernate;

import com.google.common.collect.ImmutableMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import judgels.persistence.JidGenerator;
import judgels.persistence.JudgelsDao;
import judgels.persistence.JudgelsModel;
import judgels.persistence.JudgelsModel_;
import judgels.persistence.api.dump.DumpImportMode;
import judgels.persistence.api.dump.JudgelsDump;

public abstract class JudgelsHibernateDao<M extends JudgelsModel> extends HibernateDao<M> implements JudgelsDao<M> {
    public JudgelsHibernateDao(HibernateDaoData data) {
        super(data);
    }

    @Override
    public M insert(M model) {
        model.jid = JidGenerator.newJid(getEntityClass());
        return super.insert(model);
    }

    @Override
    public M insertWithJid(String jid, M model) {
        model.jid = jid;
        return super.insert(model);
    }

    @Override
    public Map<String, M> selectByJids(Set<String> jids) {
        if (jids.isEmpty()) {
            return ImmutableMap.of();
        }

        CriteriaBuilder cb = currentSession().getCriteriaBuilder();
        CriteriaQuery<M> cq = cb.createQuery(getEntityClass());
        Root<M> root = cq.from(getEntityClass());

        cq.where(root.get(JudgelsModel_.jid).in(jids));

        List<M> result = currentSession().createQuery(cq).getResultList();
        return result.stream().collect(Collectors.toMap(p -> p.jid, p -> p));
    }

    @Override
    public Optional<M> selectByJid(String jid) {
        CriteriaBuilder cb = currentSession().getCriteriaBuilder();
        CriteriaQuery<M> cq = cb.createQuery(getEntityClass());
        Root<M> root = cq.from(getEntityClass());
        cq.where(cb.equal(root.get(JudgelsModel_.jid), jid));
        return currentSession().createQuery(cq).uniqueResultOptional();
    }

    @Override
    public M updateByJid(String jid, M model) {
        model.jid = jid;
        return super.update(model);
    }

    @Override
    public boolean existsByJid(String jid) {
        return selectByJid(jid).isPresent();
    }

    @Override
    public M findByJid(String jid) {
        return selectByJid(jid).orElse(null);
    }

    @Override
    public void setModelMetadataFromDump(M model, JudgelsDump dump) {
        super.setModelMetadataFromDump(model, dump);

        if (dump.getMode() == DumpImportMode.RESTORE) {
            model.jid = dump.getJid().orElseThrow(
                    () -> new IllegalArgumentException("jid must be set if using RESTORE mode")
            );
        } else if (dump.getMode() == DumpImportMode.CREATE) {
            model.jid = JidGenerator.newJid(getEntityClass());
        } else {
            throw new IllegalArgumentException(
                    String.format("Unknown mode: %s", dump.getMode())
            );
        }
    }
}
