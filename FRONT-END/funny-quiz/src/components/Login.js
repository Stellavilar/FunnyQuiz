import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Button, Header, Form } from 'semantic-ui-react';
import { useHistory } from 'react-router-dom';
import axios from 'axios';

const Login = () => {

    const history = useHistory();
    /**Get user data */
    const [ userProfil, setUserProfil ] = useState(
        { username: '', password : ''}
    );
    const [ userData, setUserData ] = useState({});
    const [ userPW, setUserPW ] = useState({})

    const [ errorMessage, setErrorMessage ] = useState(null);

    const handleSubmit = (e) => {
        e.preventDefault();
        axios.post('api/login', userProfil , { 
            withCredentials: true,
            headers: {
              Authorization: 'Bearer ' + localStorage.getItem('token')
            }
          })
            .then((res) => {
                localStorage.setItem('token', res.data.token.rows[0].token)
                setUserData(res.data.token.rows[0].username)
                setUserPW(res.data.token.rows[0].password)
                history.push('/');
            })
            .catch((err) => {
                console.log(err)
            })
            formValidation();
    };

    const handleChange = (e) => {
        setUserProfil({...userProfil, [e.target.name] : e.target.value });
    };

    
    const formValidation = () => {
        if(userProfil.username === '' || userProfil.password === ''){
            setErrorMessage(" * Tous les champs doivent être complétés ")
        }else if(userProfil.username !== userData || userProfil.password !== userPW){
            setErrorMessage(" * Le pseudo ou le mot de passe ne sont pas corrects ")
        }else{
            setErrorMessage(null)
        }
        return formValidation;
    };


    return (
        <div className='profil-form'>
            <Header as='h2'>Se connecter</Header>
            <Form
                onSubmit={handleSubmit}
             >
                 <Form.Field>
                     <label> Pseudonyme</label>
                     <input
                      type="text"
                      name="username"
                      onChange={handleChange}
                      />
                 </Form.Field>
                 <Form.Field>
                     <label> Mot de passe</label>
                     <input
                      type="text"
                      name="password"
                      onChange={handleChange}
                      />
                 </Form.Field>
                 { errorMessage && <p className="error">{errorMessage}</p>}
                 <div className="buttons">
                    <Button color='green' type='submit' >Valider</Button>
                        <Link to={'/'}>
                            <Button color='red'>Annuler</Button>
                        </Link>
                </div>
            </Form>
        </div>
    );

};

export default Login;