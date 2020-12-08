import { mount } from 'enzyme';
import * as React from 'react';
import { Provider } from 'react-redux';
import { push } from 'connected-react-router';
import createMockStore from 'redux-mock-store';

import MenuItemLink from './MenuItemLink';

describe('MenuItemLink', () => {
  let wrapper;
  let store;

  beforeEach(() => {
    store = createMockStore()({});
    wrapper = mount(
      <Provider store={store}>
        <MenuItemLink text="Account" to="/account" />
      </Provider>
    );
  });

  it('shows the text', () => {
    expect(wrapper.text()).toEqual('Account');
  });

  it('pushes new location when clicked', () => {
    wrapper.find('a').simulate('click');
    expect(store.getActions()).toContainEqual(push('/account'));
  });
});