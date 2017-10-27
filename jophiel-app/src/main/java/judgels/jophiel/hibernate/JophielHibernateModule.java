package judgels.jophiel.hibernate;

import dagger.Module;
import dagger.Provides;
import java.time.Clock;
import javax.inject.Singleton;
import judgels.jophiel.hibernate.user.UserHibernateDao;
import judgels.jophiel.user.UserDao;
import judgels.model.ActorProvider;
import org.hibernate.SessionFactory;

@Module
public class JophielHibernateModule {
    private final SessionFactory sessionFactory;

    public JophielHibernateModule(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Provides
    @Singleton
    SessionFactory sessionFactory() {
        return sessionFactory;
    }

    @Provides
    @Singleton UserDao userDao(Clock clock, ActorProvider actorProvider) {
        return new UserHibernateDao(sessionFactory, clock, actorProvider);
    }
}
