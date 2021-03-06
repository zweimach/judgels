import { Button, Intent } from '@blueprintjs/core';
import { Field, reduxForm } from 'redux-form';

import { Required, Max1000Lines } from '../../../../../../components/forms/validations';
import { FormTextArea } from '../../../../../../components/forms/FormTextArea/FormTextArea';

function ContestContestantAddForm({ handleSubmit, submitting, renderFormComponents }) {
  const usernamesField = {
    name: 'usernames',
    label: 'Usernames',
    labelHelper: '(one username per line, max 1000 users)',
    rows: 20,
    isCode: true,
    validate: [Required, Max1000Lines],
    autoFocus: true,
  };

  const fields = <Field component={FormTextArea} {...usernamesField} />;
  const submitButton = <Button type="submit" text="Add" intent={Intent.PRIMARY} loading={submitting} />;

  return <form onSubmit={handleSubmit}>{renderFormComponents(fields, submitButton)}</form>;
}

export default reduxForm({
  form: 'contest-contestant-add',
  touchOnBlur: false,
})(ContestContestantAddForm);
