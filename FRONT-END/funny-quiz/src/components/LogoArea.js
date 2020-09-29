import React from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Link } from 'react-router-dom';
import { Search, Button } from 'semantic-ui-react';

const LogoArea = () => {
    return (
        <div className="logo-area">
            <Link to='/'>
                <img src={logo} alt="Funny quiz logo"/>
                <p>Quizs marrants pour les petits et les grands!</p>
            </Link>
            <Search></Search>
            <div className='profile-buttons'>
                <Button>Créer un compte</Button>
                <Button>Connexion</Button>
            </div>
        </div>
    )

};

export default LogoArea;