import { Button, Dialog, Intent } from '@blueprintjs/core';
import * as React from 'react';

import { Contest } from 'modules/api/uriel/contest';
import { ContestContestantUpsertResponse } from 'modules/api/uriel/contestContestant';

import ContestContestantAddForm, {
  ContestContestantAddFormData,
} from '../ContestContestantAddForm/ContestContestantAddForm';
import { ContestContestantAddResultTable } from '../ContestContestantAddResultTable/ContestContestantAddResultTable';

import './ContestContestantAddDialog.css';

export interface ContestContestantAddDialogProps {
  contest: Contest;
  onUpsertContestants: (contestJid: string, usernames: string[]) => Promise<ContestContestantUpsertResponse>;
}

interface ContestContestantAddDialogState {
  isDialogOpen?: boolean;
  submitted?: {
    usernames: string[];
    response: ContestContestantUpsertResponse;
  };
}

export class ContestContestantAddDialog extends React.Component<
  ContestContestantAddDialogProps,
  ContestContestantAddDialogState
> {
  state: ContestContestantAddDialogState = {};

  render() {
    return (
      <div className="content-card__section">
        {this.renderButton()}
        {this.renderDialog()}
      </div>
    );
  }

  private renderButton = () => {
    return (
      <Button intent={Intent.PRIMARY} icon="plus" onClick={this.toggleDialog} disabled={this.state.isDialogOpen}>
        Add contestants
      </Button>
    );
  };

  private toggleDialog = () => {
    this.setState(prevState => ({ isDialogOpen: !prevState.isDialogOpen, submitted: undefined }));
  };

  private renderDialog = () => {
    const dialogBody =
      this.state.submitted !== undefined ? this.renderDialogAddResultTable() : this.renderDialogAddForm();
    const dialogTitle = this.state.submitted !== undefined ? 'Add contestants results' : 'Add contestants';

    return (
      <Dialog
        className="contest-contestant-add-dialog"
        isOpen={this.state.isDialogOpen || false}
        onClose={this.toggleDialog}
        title={dialogTitle}
        canOutsideClickClose={false}
        enforceFocus={false}
      >
        {dialogBody}
      </Dialog>
    );
  };

  private renderDialogAddForm = () => {
    const props: any = {
      renderFormComponents: this.renderDialogForm,
      onSubmit: this.addContestants,
    };
    return <ContestContestantAddForm {...props} />;
  };

  private renderDialogAddResultTable = () => {
    const { usernames, response } = this.state.submitted!;
    const { insertedContestantProfilesMap, alreadyContestantProfilesMap } = response;
    return (
      <>
        <div className="bp3-dialog-body contest-contestant-add-dialog-result-body">
          <ContestContestantAddResultTable
            usernames={usernames}
            insertedContestantProfilesMap={insertedContestantProfilesMap}
            alreadyContestantProfilesMap={alreadyContestantProfilesMap}
          />
        </div>
        <div className="bp3-dialog-footer">
          <div className="bp3-dialog-footer-actions">
            <Button text="Done" intent={Intent.PRIMARY} onClick={this.toggleDialog} />
          </div>
        </div>
      </>
    );
  };

  private renderDialogForm = (fields: JSX.Element, submitButton: JSX.Element) => (
    <>
      <div className="bp3-dialog-body contest-contestant-add-dialog-body">{fields}</div>
      <div className="bp3-dialog-footer">
        <div className="bp3-dialog-footer-actions">
          <Button text="Cancel" onClick={this.toggleDialog} />
          {submitButton}
        </div>
      </div>
    </>
  );

  private addContestants = async (data: ContestContestantAddFormData) => {
    const usernames = data.usernames
      .split('\n')
      .filter(s => s.length > 0)
      .map(s => s.trim());
    const response = await this.props.onUpsertContestants(this.props.contest.jid, usernames);
    if (usernames.length !== Object.keys(response.insertedContestantProfilesMap).length) {
      this.setState({ submitted: { usernames, response } });
    } else {
      this.setState({ isDialogOpen: false });
    }
  };
}
