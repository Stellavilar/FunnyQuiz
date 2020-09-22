import React from 'react';
import { render } from 'react-dom';
import App from './components/App';



const rootReactElement = () => {
  return (
    <App />
  );

};

const target = document.getElementById('root');
render(rootReactElement(), target);

