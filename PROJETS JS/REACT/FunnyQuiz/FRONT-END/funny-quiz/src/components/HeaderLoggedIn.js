import React, { useState } from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Link } from 'react-router-dom';
import { Search, Button, Header } from 'semantic-ui-react';
import { useParams } from 'react-router';
import { useHistory } from 'react-router-dom';

import axios from 'axios';
import BurgerButtonLoggedIn from './BurgerButtonLoggedIn';

const HeaderLoggedIn = () => {
    const history = useHistory();

    /**Get user data */
    const [ userData, setUserData ] = useState({});
    let {id} = useParams();
    const userInfos = () => {
        axios
            .get(`/users/${id}` , { 
                withCredentials: true,
                headers: {
                  Authorization: 'Bearer ' + localStorage.getItem('token')
                }
            })
            .then((res) => {
                setUserData(res.data)
            })
            .catch((err) => {
                console.log(err);
            })
            
    };
    userInfos();

    /**Search */
    const [ searchText, setSearchText ] = useState("");
    const [ results, setResults ] = useState({});
    
    const getResults = (e) => {
        const text = searchText;
        const SEARCH_URL = `quiz/subcategory/?q=${text}`;
        axios
            .get(SEARCH_URL)
            .then((res) => {
                setResults(res.data)
            })
            .catch((err) => {
                console.log(err);
            }); 
            return getResults;  
    };
    getResults();

    const handleChange = (e) => {
        setSearchText(e.target.value);
    };
    const getQuiz = (id) => {
        history.push(`/classifiedQuiz/${id}`)
    };

    const disconnect = () => {
       
        const token = localStorage.getItem('token');
        
        axios
            .get('api/logout', { headers:{
                Authorization: 'Bearer ' + token,
            },        
          }) 
          .then((res) => {
              localStorage.removeItem('token')
              window.location.reload(false)
          })
          .catch((err) => {
              console.log(err)
          })
          return disconnect;
    };
  

    return (
        <>
            <div className="logo-area">
                <Link to='/'>
                    <img src={logo} alt="Funny quiz logo"/>
                </Link>
                <Search
                value={searchText}
                onSearchChange={handleChange}
                results={results}
                onResultSelect={(e, data) =>
                   getQuiz(data.result.id)
                  }
                 />
                <div className='profile-buttons'>
                    <Header as='h2'>Hello {userData.username} </Header> 
                    <Button color='red' onClick={disconnect}>Déconnexion</Button>
                    <Button color='blue' onClick={() => history.push(`/profilPage/${userData.id}`)}>Voir profil</Button>        
                </div>
                <BurgerButtonLoggedIn/>
            </div>
            <p className='slogan'>Quizs marrants pour les petits et les grands!</p>
            
        </>
    )

};

export default HeaderLoggedIn;