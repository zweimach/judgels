package judgels.gabriel.evaluators;

import java.io.File;
import judgels.gabriel.api.EvaluationException;
import judgels.gabriel.api.EvaluationResult;
import judgels.gabriel.api.Evaluator;
import judgels.gabriel.evaluators.helpers.Communicator;

public class InteractiveEvaluator implements Evaluator {
    private Communicator communicator;

    public void prepare(Communicator communicator) {
        this.communicator = communicator;
    }

    @Override
    public EvaluationResult evaluate(File input, File output) throws EvaluationException {
        return communicator.communicate(input);
    }
}
