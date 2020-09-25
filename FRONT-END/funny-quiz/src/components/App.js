import React, { useState, useEffect } from 'react';
import { Route } from 'react-router-dom';
import axios from 'axios';
import '../styles/index.scss';


import Header from './Header';
import Quiz from './Quiz';
import LogoArea from './LogoArea';
import Slides from './Slides';

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
/**Get answers */
const [ answer, setAnswer ] = useState([]);
const answerUrl = 'http://localhost:1234/answers';
const answers = () => {
  axios.get(
    answerUrl,
)
.then((res) => {
    setAnswer(res.data)
})
.catch((err) => {
    console.log(err)
})
return answers
};


useEffect(tags, []);
useEffect(levels, []);
useEffect(answers, []);
  

  return (
    <>
      <header className="header">
        <Route exact path='/'>
          <LogoArea />
         </Route>
      </header>
      <main className="main">
        <div className="dashboard">
          <Route exact path='/'>
            <Header
            tag={tag}
            level={level}
            />
            <Slides />
          </Route>
        </div>
        <Route exact path='/specificQuiz/:tagId/level/:levelId'>
          <LogoArea />
          <Quiz 
           answer={answer}/>
        </Route>
      </main>
      <footer className="footer">
     
      </footer>
    </>
  );
}

export default App;
