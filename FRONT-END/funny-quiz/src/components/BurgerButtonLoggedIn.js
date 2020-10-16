import React, { useState } from 'react';
import { Dropdown } from 'semantic-ui-react';
import { useHistory } from 'react-router-dom';
import { useParams } from 'react-router';
import axios from 'axios';

const BurgerButtonLoggedIn = () => {
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
        <div className="burger-button">
            <Dropdown item text='' icon='bars'>
                <Dropdown.Menu>
                    <Dropdown.Item onClick={() => history.push(`/profilPage/${userData.id}`)}>Voir profil</Dropdown.Item>
                    <Dropdown.Item onClick={disconnect}>Déconnexion</Dropdown.Item>
                </Dropdown.Menu>
            </Dropdown>
        </div>
    );
};

export default BurgerButtonLoggedIn;