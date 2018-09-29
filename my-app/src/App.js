import React, { Component } from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import './App.css';
import TodoList from './components/TodoList';
import "bootstrap/dist/css/bootstrap.min.css";

class App extends Component {
  render() {
    return (
       <Router>
        <div className="container">
          <h2 align="center">React ActionCable With Grape Gem Task</h2>
          <hr />
              <Switch>
              <Route exact path='/todo' component={ TodoList } />
              </Switch>
              <TodoList></TodoList>
        </div>
      </Router>  
    );
  }
} 
export default App;
