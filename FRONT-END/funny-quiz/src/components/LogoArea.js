import React, { useState } from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Link } from 'react-router-dom';
import { Search, Button, Header } from 'semantic-ui-react';
import { useHistory } from 'react-router-dom';
import axios from 'axios';



const LogoArea = ({user}) => {
    const history = useHistory();
    // const token = localStorage.getItem('token');

    // const [ getLoggedIn, setGetLoggedIn ] = useState(true)
    const onClickCreate = () => {
        history.push('/createProfil');
    };
    const onClickConnect = () => {
        history.push('/connect');
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
          })
          .catch((err) => {
              console.log(err)
          })
          return disconnect;
    };
    

    return (
        
        <div className="logo-area">
            <Link to='/'>
                <img src={logo} alt="Funny quiz logo"/>
                <p>Quizs marrants pour les petits et les grands!</p>
            </Link>
            <Search></Search>
            <div className='profile-buttons'>
                <Header as='h2'></Header> 
                
                <Button color='red' onClick={disconnect}>Déconnexion</Button> 
                <Button onClick={onClickCreate}>Créer un compte</Button> 
                <Button onClick={onClickConnect}>Connexion</Button>   
                    
            </div>
        </div>
    )

};

export default LogoArea;