import React from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Search } from 'semantic-ui-react';

const LogoArea = () => {
    return (
        <div className="logo-area">
            <img src={logo} alt="Funny quiz logo"/>
            <p>Quizs marrants pour les petits et les grands!</p>
            <Search></Search>
        </div>
    )

};

export default LogoArea;