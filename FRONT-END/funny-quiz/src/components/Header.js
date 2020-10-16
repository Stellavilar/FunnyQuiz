import React, { useState } from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Link } from 'react-router-dom';
import { Button, Search } from 'semantic-ui-react';
import { useHistory } from 'react-router-dom';
import axios from 'axios';

import BurgerButton from './BurgerButton';
import BurgerButtonLoggedIn from './BurgerButtonLoggedIn';


const Header = () => {
    const history = useHistory();

    const onClickCreate = () => {
        history.push('/createProfil');
    };
    const onClickConnect = () => {
        history.push('/connect');
    };

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
    }
    
    const token = localStorage.getItem('token');

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
                    <Button onClick={onClickCreate}>Créer un compte</Button> 
                    <Button onClick={onClickConnect}>Connexion</Button>   
                </div>
                { token ? <BurgerButtonLoggedIn/> : <BurgerButton/> }
            </div>
            <p className='slogan'>Quizs marrants pour les petits et les grands!</p>
        </>
    )

};

export default Header;