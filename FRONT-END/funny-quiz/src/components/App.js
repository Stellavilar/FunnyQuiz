import React, { useState, useEffect } from 'react';
import { Route } from 'react-router-dom';
import axios from 'axios';
import '../styles/index.scss';


import Header from './Header';
import Quiz from './Quiz';
import LogoArea from './LogoArea';

const App = () => {
  /**Get tags */
  const [ tag, setTag] = useState([]);
  const url = 'http://localhost:1234/tags';
  const tags = () => {
        axios.get(
            url,
        )
        .then((res) => {
            setTag(res.data)
        })
        .catch((err) => {
            console.log(err)
        })
        return tags
    };
    
  /**get levels */
  const [ level, setLevel ] = useState([]);
  const levelUrl = 'http://localhost:1234/levels';
  const levels = () => {
    axios.get(
      levelUrl,
  )
  .then((res) => {
      setLevel(res.data)
  })
  .catch((err) => {
      console.log(err)
  })
  return levels
};


useEffect(tags, []);
useEffect(levels, []);
  

  return (
    <>
      <header className="header">
        <Route exact path='/'>
          <LogoArea />
          <Header
          tag={tag}
          level={level}
          />
         </Route>
      </header>
      <main className="main">
        <Route exact path='/specificQuiz/:tagId/level/:levelId'>
          <LogoArea />
          <Quiz />
        </Route>
      </main>
      <footer className="footer">
     
      </footer>
    </>
  );
}

export default App;
