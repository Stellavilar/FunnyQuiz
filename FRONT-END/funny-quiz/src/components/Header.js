import React from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Link } from 'react-router-dom';
import { Search, Button } from 'semantic-ui-react';
import { useHistory } from 'react-router-dom';


const Header = ({user}) => {
    const history = useHistory();

    const onClickCreate = () => {
        history.push('/createProfil');
    };
    const onClickConnect = () => {
        history.push('/connect');
    };
    
    return (
        <>
            <div className="logo-area">
                <Link to='/'>
                    <img src={logo} alt="Funny quiz logo"/>
                </Link>
                <Search></Search>
                <div className='profile-buttons'>
                    <Button onClick={onClickCreate}>Créer un compte</Button> 
                    <Button onClick={onClickConnect}>Connexion</Button>   
                </div>
            </div>
            <p className='slogan'>Quizs marrants pour les petits et les grands!</p>
        </>
    )

};

export default Header;