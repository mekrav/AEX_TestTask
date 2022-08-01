import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';
import { Layout } from './components/Layout';
import { Home } from './components/Home';
import { MovieInfo } from './MovieInfo'

import './custom.css'

export default class App extends Component {
  static displayName = App.name;

  render () {
    return (
        <Layout>
            <Switch>
                <Route path="/movieinfo/:id" component={MovieInfo} />
                <Route path="/" component={Home} />
            </Switch>
        </Layout>
    );
  }
}
