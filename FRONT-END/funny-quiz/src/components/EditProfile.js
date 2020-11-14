import React, { useState } from 'react';
import { Form, Header, Button } from 'semantic-ui-react';
import { useParams } from 'react-router';
import { Link } from 'react-router-dom';
import logo from '../img/FUNNY QUIZ.jpg';
import { useHistory } from 'react-router-dom';
import axios from 'axios';

import validatePassword from '../utils/password.utils';

const EditProfile = () => {
    const history = useHistory();
    const [ errorMessage, setErrorMessage ] = useState(null);
    
    /**Get input informations */
    const [ userProfil, setUserProfil ] = useState(
        { username: '', password: ''}
    );
    
    const handleChange = (e) => {
        setUserProfil({...userProfil, [e.target.name] : e.target.value });
    };
    let {id} = useParams();
    const handleSubmit = (e) => {
        e.preventDefault(); 
        
        axios.patch(`edit/${id}`, userProfil)
            .then((res) => {
              if(window.confirm('Confirmez-vous la modification ?')) 
                  return history.push(`/profilPage/${id}`)  
            })
            .catch((err) => {
                console.log(err)
            })
            formValidation();
    };

    const formValidation = () => {
        if(userProfil.username === '' || userProfil.password === ''){
            setErrorMessage(" * Tous les champs doivent être complétés ")
        }else if(!validatePassword.validate(userProfil.password)){
            setErrorMessage(" * Votre mot de passe doit contenir au moins 8 caractères et 1 chiffre minimum")
        }else{
            setErrorMessage(null)
        }
        return formValidation;
    };

     /**Handle click on cancel button*/
     const handleClick = () => {
        history.goBack();
    };

    return (
        <div className='profil-form'>
            <Link to='/'>
                <img src={logo} alt="Funny quiz logo"/>
                <p>Quizs marrants pour les petits et les grands!</p>
            </Link>
            <Header as='h2'>Modifier vos identifiants</Header>
            <Form
             onSubmit={handleSubmit}
             >
                 <Form.Field>
                     <label> Nouveau Pseudonyme</label>
                     <input
                      type="text"
                      name="username"
                      value={userProfil.username}
                      onChange={handleChange}
                      />
                 </Form.Field>
                 <Form.Field>
                     <label> Nouveau Mot de passe</label>
                     <input
                      type="password"
                      name="password"
                      placeholder="8 caractères minimum et au moins un chiffre"
                      value={userProfil.password}
                      onChange={handleChange}
                      />
                      { errorMessage && <p className="error">{errorMessage}</p>}
                 </Form.Field>
                 <div className="buttons">
                    <Button color='green' type='submit'>Valider</Button>
                </div>
            </Form>
            <Button color='red' onClick={handleClick}>Annuler</Button> 
        </div>
    )
};

export default EditProfile;