import React, { useState, useEffect } from 'react';
import { Header, Segment, Button, Dimmer, Loader } from 'semantic-ui-react';
import { useParams } from 'react-router';
import { useHistory } from 'react-router-dom';
import logo from '../img/FUNNY QUIZ.jpg';


import axios from 'axios';


const ProfilPage = () => {
    const history = useHistory();

    const [ userData, getUserData ] = useState([]);
    let {id} = useParams();
    const userProfil = () => {
        axios
            .get(`/users/${id}` , { 
                withCredentials: true,
                headers: {
                  Authorization: 'Bearer ' + localStorage.getItem('token')
                }
            })
            .then((res) => {
                getUserData(res.data);                
                setLoading(true);
            })
            .catch((err) => {
                console.log(err);
            })
    };
   userProfil();

   /**Get game history by user */
   const [ userHistory, setUserHistory ] = useState([]);
   const getHistory = () => {
       axios
        .get(`scoresbyuser/user/${id}` , { 
            withCredentials: true,
            headers: {
              Authorization: 'Bearer ' + localStorage.getItem('token')
            }
        })
        .then((res) => {
            setUserHistory(res.data);
        })
        .catch((err) => {
            console.log(err);
        })
   };
 

   const getHistoryData = userHistory.map((historyData) => 
        <li key={historyData.id}>{new Intl.DateTimeFormat('fr-FR').format(new Date(historyData.created_at))}: {historyData.number} points</li>
   );

   const handleClick = () => {
        history.push(`/user/${id}`);
   };

    /**Loader */
    const [ loading, setLoading ] = useState(false);

   useEffect(getHistory, []);
   useEffect(userProfil, []);

   
    return (
        <div className='profil-page'>
            <div className="header">
                    <img onClick={handleClick} src={logo} alt="Funny quiz logo"/>
            </div>
            <p className="arrow" onClick={handleClick}>&#8678; Retour à la page d'accueil</p>
            <Segment>
                {loading ? [] :  <Dimmer active inverted><Loader inverted /></Dimmer> }
                <Header as='h2' className='welcome'>Bienvenue sur ton Profil {userData.username}!</Header>
                <Header as='h2'>Voici ton historique de jeux:</Header>
                { userHistory ? <ul>{getHistoryData}</ul> : <p>Erreur</p>}
               
            </Segment>
            <Button onClick={() => history.push(`/editprofile/${userData.id}`)}  >Modifier le profil</Button>
        </div>

    );

};

export default ProfilPage;