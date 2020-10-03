import React, { useState } from 'react';
import { Header, Segment, Button } from 'semantic-ui-react';
import { useParams } from 'react-router';
import { useHistory } from 'react-router-dom';

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
                getUserData(res.data)
            })
            .catch((err) => {
                console.log(err);
            })
            // return userProfil;
    };
   userProfil()

    return (
        <div className='profil-page'>
            <Segment>
                <Header as='h2'>Bienvenue sur ton Profil {userData.username}!</Header>
            </Segment>
            <Button onClick={() => history.push(`/editprofile/${userData.id}`)}  >Modifier le profil</Button>
        </div>

    );

};

export default ProfilPage;