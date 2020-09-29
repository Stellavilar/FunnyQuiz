import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router';
import { Segment, Header, Form, Checkbox } from 'semantic-ui-react';


const Quiz = () => {
    /**Check answer */
    const [ answ, setAnsw ] = useState([]);
    /**Handle checkbox */
    const [ state, setState] = useState({});
    const handleChange = (e, { value }) => setState({value}, console.log(value));
    /**Show anecdote */
    const [ showWiki, setShowWiki ] = useState([]);
   
    /**Handle submit form */
    const handleSubmit = (e) => {
        e.preventDefault();
        let paragraph = e.target.lastElementChild;
        e.target.reset();
        
        if(!state.value){
            paragraph.textContent = ' * Vous n\'avez pas coché de réponse !';
            paragraph.className = 'noAnswer';
        }
        else if (state.value === answ){
            paragraph.textContent = 'Bonne réponse :  ' + showWiki;
            paragraph.className = 'goodAnswer';
        }else{
            paragraph.textContent = 'Mauvaise réponse...';
            paragraph.className = 'badAnswer';
        }
    };

    /**Get quiz by tag and level */
    let { tagId, levelId } = useParams();
    const [ quiz, setQuiz ] = useState ([]);

    const quizzes = () => {
        axios
            .get(`http://localhost:1234/tags/${tagId}/levels/${levelId}`)
            .then((res) => {
                setQuiz(res.data)
            })
            .catch((err) => {
                console.log(err)
            })

        return quizzes;
    };
    
    useEffect(quizzes, []);
   
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

    return (
            <div className="quiz">
                <Header as='h2'>Questions</Header>
                {getQuiz}
            </div>
    );
};


export default Quiz;
