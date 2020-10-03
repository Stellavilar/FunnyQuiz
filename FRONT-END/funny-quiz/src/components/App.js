import React, { useState, useEffect } from 'react';
import { Route, Switch } from 'react-router-dom';
import axios from 'axios';
import '../styles/index.scss';


import ItemMenu from './ItemMenu';
import Quiz from './Quiz';
import Header from './Header';
import HeaderLoggedIn from './HeaderLoggedIn';
import SubCatQuiz from './SubCatQuiz';
import Slides from './Slides';
import ProfilForm from './ProfilForm';
import Login from './Login';
import ProfilPage from './ProfilPage';
import EditProfile from './EditProfile';
import Page404 from './Page404';

const App = () => {
  /**Get tags */
  const [ tag, setTag] = useState([]);
  const tags = () => {
        axios
        .get( 'tags')
        
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
  const levels = () => {
    axios
    .get('levels')
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
const categories = () => {
  axios.get('subcategories')
.then((res) => {
    setCategory(res.data)
})
.catch((err) => {
    console.log(err)
})
return categories
};

/**Get users */
const [ user, setUser ] = useState({});
const users = () => {
  axios
    .get('users', { 
      withCredentials: true,
      headers: {
        Authorization: 'Bearer ' + localStorage.getItem('token')
      }
    })
    .then((res) => {
      setUser(res.data)
    })
    .catch((err) => {
      console.log(err)
    })
    return users;
}


useEffect(tags, []);
useEffect(levels, []);
useEffect(categories, []);
useEffect(users, []);

  

  return (
    <div className="main">
      <Switch>
        <Route exact path='/connect'>
          <Header user={user}/>
          <Login />
        </Route>
        <Route exact path='/'>
          <Header user={user}/>
            <ItemMenu tag={tag} level={level} />
            <Slides category={category} user={user} />
        </Route>
        <Route exact path='/user/:id'>
          <HeaderLoggedIn />
            <ItemMenu tag={tag} level={level} />
            <Slides category={category}/>
        </Route>
        <Route exact path='/specificQuiz/:tagId/level/:levelId'>
            <Quiz />
        </Route>
        <Route exact path='/classifiedQuiz/:id'>
            <SubCatQuiz />
        </Route>
        <Route exact path='/createProfil'>
            <ProfilForm />
        </Route>
        <Route exact path='/profilPage/:id'>
            <HeaderLoggedIn />
            <ProfilPage/>
        </Route>
        <Route exact path='/editProfile/:id'>
            <HeaderLoggedIn />
            <EditProfile/>
        </Route>
        <Route><Page404/></Route>
      </Switch>
    </div>
  );
}

export default App;
