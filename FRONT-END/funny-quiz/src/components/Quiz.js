import React, { useState, useEffect } from 'react';
import axios from 'axios';
import logo from '../img/FUNNY QUIZ.jpg';
import { useParams } from 'react-router';
import { useHistory } from 'react-router-dom';
import { Segment, Header, Form, Checkbox, Dimmer, Loader } from 'semantic-ui-react';


const Quiz = () => {
    const history = useHistory();
    /**Check answer */
    const [ answ, setAnsw ] = useState([]);
    /**Handle checkbox */
    const [ state, setState] = useState({});
    const handleChange = (e, { value }) => setState({value});
    /**Show anecdote */
    const [ showWiki, setShowWiki ] = useState([]);
    /**Show title and level*/
    const [ getTitle, setGetTitle ] = useState('');
    const [ getLevel, setGetLevel ] = useState('');
    /**Count score */
    const [ count, setCount ] = useState(0);
    /**Loader */
    const [ loading, setLoading ] = useState(false);

    /**Handle submit form */
    const handleSubmit = (e) => {
        e.preventDefault();
        const paragraph = e.target.lastElementChild;
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

    /**Save score */
    const handleChangeScore = (e) => { console.log(e.target) };
    const handleSubmitScore = (e) => {
        e.preventDefault();
        const result = {
            number: e.target.children[1].valueAsNumber,
            tag_id: tagId,
            level_id: levelId
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
                console.log(res);
                history.push(`/profilPage/${userId}`)
            })
            .catch((err) => {
                console.log(err);
            })
    };
  
    /**Get quiz by tag and level */
    let { tagId, levelId } = useParams();
    const [ quiz, setQuiz ] = useState ([]);

    const quizzes = () => {
        axios
            .get(`tags/${tagId}/levels/${levelId}`)
            .then((res) => {
                setQuiz(res.data);
                setGetTitle(res.data[0].tag.title);
                setGetLevel(res.data[0].level.title);
                setLoading(true);
                console.log(res.data)
            })
            .catch((err) => {
                console.log(err)
            })
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
    
    useEffect(quizzes, []);
    useEffect(userInfos, []);

    const getQuiz = quiz.map((quizzes) =>
        <Segment key={quizzes.id}>
            <li>{quizzes.question}</li>
            <Form
             onSubmit={handleSubmit}
             
            >
                <Checkbox radio label={quizzes.prop2} value={quizzes.prop2} checked={state.value === quizzes.prop2} onChange={handleChange} onClick={e => setAnsw(quizzes.answer.title)}/>
                <Checkbox radio label={quizzes.prop1} value={quizzes.prop1} checked={state.value === quizzes.prop1} onChange={handleChange} onClick={e => setAnsw(quizzes.answer.title)}/>
                <Checkbox radio label={quizzes.prop3} value={quizzes.prop3} checked={state.value === quizzes.prop3} onChange={handleChange} onClick={e => setAnsw(quizzes.answer.title)}/>
                <Checkbox radio label={quizzes.prop4} value={quizzes.prop4} checked={state.value === quizzes.prop4} onChange={handleChange} onClick={e => setAnsw(quizzes.answer.title)}/>
                <Form.Button color='grey' type='submit' onClick={e => setShowWiki(quizzes.anecdote)}>Valider</Form.Button>
                <p></p>
            </Form>
            
        </Segment> 
    );
   
    const token = localStorage.getItem('token');
    return (
            <div className="quiz">
                <div className="header">
                    <img onClick={handleClick} src={logo} alt="Funny quiz logo"/>
                    {token ? <p> À toi de jouer {userData.username} !</p> : <p>À toi de jouer !</p>}
                </div>
                <div className="main-quiz">
                    <p className="arrow" onClick={handleClick}>&#8678; Retour en arrière</p>
                    <Header as='h2'> Thème : {getTitle} / {getLevel}</Header>
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
    );
};


export default Quiz;
