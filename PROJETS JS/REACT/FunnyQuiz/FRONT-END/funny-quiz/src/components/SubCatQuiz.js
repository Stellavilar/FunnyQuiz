import React, { useState, useEffect } from 'react';
import axios from 'axios';
import logo from '../img/FUNNY QUIZ.jpg';
import { useHistory } from 'react-router-dom';
import { useParams } from 'react-router';
import { Segment, Header, Form, Checkbox, Dimmer, Loader } from 'semantic-ui-react';

const SubCatQuiz = () => {
    const history = useHistory();

    /**Check answer */
    const [ answ, setAnsw ] = useState([]);
    /**Show anecdote */
    const [ showWiki, setShowWiki ] = useState([]);
    /**Handle checkbox */
    const [ state, setState] = useState({});
    const handleChange = (e, { value }) => setState({value});
    /**Count score */
    const [ count, setCount ] = useState(0);
    /**Loader */
    const [ loading, setLoading ] = useState(false);

    /**Handle submit form */
    const handleSubmit = (e) => {
        e.preventDefault();
        let paragraph = e.target.lastElementChild;
        e.target.reset();
        const button = e.target.children[3];
        button.nextElementSibling.remove();

        if(!state.value){
            paragraph.textContent = ' * Vous n\'avez pas coché de réponse !';
            paragraph.className = 'noAnswer';
        }
        else if (state.value === answ){
            paragraph.textContent = 'Bonne réponse :  ' + showWiki;
            paragraph.className = 'goodAnswer';
            setCount(count + 1);
        }else{
            paragraph.textContent = 'Mauvaise réponse...';
            paragraph.className = 'badAnswer';         
        }
        
    };

    /**Handle click on logo */
    const handleClick = () => {
        history.goBack();
    };

    let {id} = useParams();
    const [ subCat, setSubCat ] =useState([]);
  
    const subCategories = () => {
        axios.get
        (`quizzes/subcategory/${id}`)
        .then((res) => {
            setSubCat(res.data);
            setLoading(true);      
        })
        .catch((err) => {
            console.log(err)
        })

        return subCategories;
    };

    /**Get user data */
    const [ userData, setUserData ] = useState({});
    const [ userId, setUserId ] = useState({});
    const userInfos = () => {
        axios
            .get(`/userbytoken` , { 
                withCredentials: true,
                headers: {
                  Authorization: 'Bearer ' + localStorage.getItem('token')
                }
            })
            .then((res) => {
                setUserData(res.data[0])
                setUserId(res.data[0].id)
            })
            .catch((err) => {
                console.log(err);
            })
            
    };
    userInfos();

    /**Save score if user is connected */
    const handleChangeScore = (e) => { console.log(e.target) };
    const handleSubmitScore = (e) => {
        e.preventDefault();
        const result = {
            number: e.target.children[1].valueAsNumber,
            subcategory_id: id,
        }
        axios
            .post(`user/${userId}/scores`, result, {
                headers: {
                  Authorization: 'Bearer ' + localStorage.getItem('token'),
                  post: {
                    'Content-Type': 'multipart/form-data',
                  },
                }
            })
            .then((res)=> {
                history.push(`/profilPage/${userId}`)
            })
            .catch((err) => {
                console.log(err);
            })
    };

    useEffect(subCategories, []);
    useEffect(userInfos, []);


    const getQuiz = subCat.map((subcateg) =>
        <Segment key={subcateg.id}>
            <li>{subcateg.question}</li>
        <Form
        onSubmit={handleSubmit}
        >
            <Checkbox radio label={subcateg.prop2} value={subcateg.prop2} checked={state.value === subcateg.prop2} onChange={handleChange} onClick={e => setAnsw(subcateg.answer.title)}/>
            <Checkbox radio label={subcateg.prop3} value={subcateg.prop3} checked={state.value === subcateg.prop3} onChange={handleChange} onClick={e => setAnsw(subcateg.answer.title)}/>
            <Checkbox radio label={subcateg.prop1} value={subcateg.prop1} checked={state.value === subcateg.prop1} onChange={handleChange} onClick={e => setAnsw(subcateg.answer.title)}/>
            <Checkbox radio label={subcateg.prop4} value={subcateg.prop4} checked={state.value === subcateg.prop4} onChange={handleChange} onClick={e => setAnsw(subcateg.answer.title)}/>
            <Form.Button color='grey' type='submit' onClick={e => setShowWiki(subcateg.anecdote)} >Valider</Form.Button>
            <p></p>
        </Form>
    </Segment> 
    )

    const token = localStorage.getItem('token');

    return (
        <div className='quiz'>
            <div className="header">
                <img onClick={handleClick} src={logo} alt="Funny quiz logo"/>
                {token ? <p> À toi de jouer {userData.username} !</p> : <p>À toi de jouer !</p>}
            </div>
            <div className="main-quiz">
                <p className="arrow" onClick={handleClick}>&#8678; Retour en arrière</p>
                <Header as='h2'>Questions</Header>
                {loading ? [] :  <Dimmer active inverted><Loader inverted /></Dimmer> }
                {getQuiz}
                <Form
                    className="score"
                    onSubmit={handleSubmitScore}>
                        <p>Vous avez</p>
                        <input
                        style={{border: 'none', width: '7%', fontFamily: 'Grandstander',}}
                        type="number"
                        name="number"
                        value={count}
                        onChange={handleChangeScore}
                        />
                        <p>points</p>
                        {token ? <Form.Button>Sauvegarder</Form.Button> : <Form.Button disabled >Sauvegarder</Form.Button> }
                    
                </Form>
            </div>
        </div>
    )

};

export default SubCatQuiz;
