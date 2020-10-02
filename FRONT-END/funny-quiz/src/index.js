import React from 'react';
import { render } from 'react-dom';
import { BrowserRouter as Router } from 'react-router-dom';
import App from './components/App';
import axios from 'axios';


axios.defaults.baseURL = 'http://localhost:1234/';
// const ec2 = 'http://ec2-54-242-189-29.compute-1.amazonaws.com:1234/

const rootReactElement = () => {
  return (
    <Router>
      <App />
    </Router>
  );

};

const target = document.getElementById('root');
render(rootReactElement(), target);

