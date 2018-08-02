import * as classNames from 'classnames';
import * as React from 'react';

import { ScoreboardState } from 'modules/api/uriel/scoreboard';

import './ScoreboardTable.css';

export class ScoreboardTableProps {
  className: string;
  state: ScoreboardState;
  children?: any;
}

export class ScoreboardTable extends React.PureComponent<ScoreboardTableProps> {
  render() {
    return (
      <table
        className={classNames('bp3-html-table', 'bp3-html-table-striped', 'scoreboard__content', this.props.className)}
      >
        {this.renderHeader(this.props.state)}
        {this.props.children}
      </table>
    );
  }

  private renderHeader = (state: ScoreboardState) => {
    const problems = state.problemAliases.map(alias => (
      <th key={alias} className="problem-cell">
        {alias}
      </th>
    ));

    return (
      <thead>
        <tr>
          <th className="rank-cell">#</th>
          <th className="contestant-cell">Contestant</th>
          <th className="problem-cell">Total</th>
          {problems}
        </tr>
      </thead>
    );
  };
}