import React, { useState, useEffect } from 'react';
import { Route } from 'react-router-dom';
import axios from 'axios';
import '../styles/index.scss';


import Header from './Header';
import Quiz from './Quiz';
import LogoArea from './LogoArea';
import SubCatQuiz from './SubCatQuiz';
import Slides from './Slides';
import ProfilForm from './ProfilForm';
//import Page404 from './Page404';

const App = () => {
  /**Get tags */
  const [ tag, setTag] = useState([]);
  // const url = 'http://ec2-54-242-189-29.compute-1.amazonaws.com:1234/tags';
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
  // const levelUrl = 'http://ec2-54-242-189-29.compute-1.amazonaws.com:1234/levels';
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

/**Get subcategories */
const [ category, setCategory ] = useState ([]);
// const categoryUrl = 'http://ec2-54-242-189-29.compute-1.amazonaws.com:1234/subcategories';
const categoryUrl = 'http://localhost:1234/subcategories';

const categories = () => {
  axios.get(
    categoryUrl,
)
.then((res) => {
    setCategory(res.data)
})
.catch((err) => {
    console.log(err)
})
return categories
};


useEffect(tags, []);
useEffect(levels, []);
useEffect(categories, []);

  

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
            <Slides 
             category={category}/>
          </Route>
        </div>
          <Route exact path='/specificQuiz/:tagId/level/:levelId'>
            <LogoArea />
            <Quiz />
          </Route>
          <Route exact path='/classifiedQuiz/:id'>
            <LogoArea />
            <SubCatQuiz />
          </Route>
          <Route exact path='/createProfil'>
            <ProfilForm />
          </Route>
      </main>
      <footer className="footer">
     
      </footer>
    </>
  );
}

export default App;
