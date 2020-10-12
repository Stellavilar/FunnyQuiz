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
import Footer from './Footer';
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

/**Get token */
const token = localStorage.getItem('token')


useEffect(tags, []);
useEffect(levels, []);
useEffect(categories, []);
useEffect(users, []);

  

  return (
    <div className="main">
      <Switch>
        <Route exact path='/connect'>
          {/* {token ? <HeaderLoggedIn /> : <Header user={user}/> } */}
          <Login />
          <Footer />
        </Route>
        <Route exact path='/'>
          {token ? <HeaderLoggedIn /> : <Header user={user}/> }
            <ItemMenu tag={tag} level={level} />
            <Slides category={category} user={user} />
            <Footer />
        </Route>
        <Route exact path='/user/:id'>
          {token ? <HeaderLoggedIn /> : <Header user={user}/> }
            <ItemMenu tag={tag} level={level} />
            <Slides category={category}/>
            <Footer />
        </Route>
        <Route exact path='/specificQuiz/:tagId/level/:levelId'>
          {/* {token ? <HeaderLoggedIn /> : <Header user={user}/> } */}
            <Quiz />
            <Footer />
        </Route>
        <Route exact path='/classifiedQuiz/:id'> 
          {token ? <HeaderLoggedIn /> : <Header user={user}/> }
            <SubCatQuiz />
            <Footer />
        </Route>
        <Route exact path='/createProfil'>
            <ProfilForm />
            <Footer />
        </Route>
        <Route exact path='/profilPage/:id'>
            {token ? <HeaderLoggedIn /> : <Header user={user}/> }
            <ProfilPage/>
            <Footer />
        </Route>
        <Route exact path='/editProfile/:id'>
            {token ? <HeaderLoggedIn /> : <Header user={user}/> }
            <EditProfile/>
            <Footer />
        </Route>
        <Route><Page404/><Footer /></Route>
      </Switch>
    </div>
  );
}

export default App;
