import React, { useState } from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Link } from 'react-router-dom';
import { Search, Button, Header } from 'semantic-ui-react';
import { useParams } from 'react-router';
import { useHistory } from 'react-router-dom';

import axios from 'axios';



const LogoAreaBis = () => {
    const history = useHistory();

    /**Get user data */
    const [ userData, getUserData ] = useState({});
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
                getUserData(res.data)
            })
            .catch((err) => {
                console.log(err);
            })
            
    };
    userInfos();

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
        <>
            <div className="logo-area">
                <Link to='/'>
                    <img src={logo} alt="Funny quiz logo"/>
                </Link>
                <Search></Search>
                <div className='profile-buttons'>
                    <Header as='h2'>Hello {userData.username} </Header> 
                    <Button color='red' onClick={disconnect}>Déconnexion</Button>
                    <Button color='blue' onClick={() => history.push(`/profilPage/${userData.id}`)}>Voir profil</Button>        
                </div>
            </div>
            <p className='slogan'>Quizs marrants pour les petits et les grands!</p>

        </>
    )

};

export default LogoAreaBis;