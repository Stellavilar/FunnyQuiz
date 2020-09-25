import React, { useState, useEffect, createRef } from 'react';
import axios from 'axios';
import { useParams } from 'react-router';
import { Segment, Header, Form, Checkbox } from 'semantic-ui-react';

const Quiz = () => {
    //const [ getAnswer, setGetAnswer ] = useState([]);
    const getRef = createRef();
    /**Handle checkbox */
    const [ state, setState] = useState({});
    const handleChange = (e, { value }) => setState({value}, console.log(value));
   
    /**Handle submit form */
    const handleSubmit = (e) => {
        e.preventDefault();
        if(!state.value){
            return console.log('Vous n\'avez pas coché de réponse !')
        }
        if (state.value === 'Se rafraîchir'){
            console.log('Bonne réponse')
        }else{
            console.log('Mauvaise Réponse');
           
        }
        
    };

    /**Get quiz by tag and level */
    let { tagId, levelId } = useParams();
    const [ quiz, setQuiz ] = useState ([]);
    const url = `http://localhost:1234/tags/${tagId}/levels/${levelId}`;

    const quizzes = () => {
        axios.get(
            url,
        )
        .then((res) => {
            setQuiz(res.data)
        
        })
        .catch((err) => {
            console.log(err)
        })

        return quizzes;
    };
    
    useEffect(quizzes, []);
   console.log(getRef.current)
    const getQuiz = quiz.map((quizzes, index) => 
        <Segment key={quizzes.id}>
            <li>{quizzes.question}</li>
            <Form
             onSubmit={handleSubmit}
            >
                <Checkbox radio label={quizzes.prop1} value={quizzes.prop1} checked={state.value === quizzes.prop1} onChange={handleChange} />
                <Checkbox radio label={quizzes.prop2} value={quizzes.prop2} checked={state.value === quizzes.prop2} onChange={handleChange}/>
                <Checkbox radio label={quizzes.prop3} value={quizzes.prop3} checked={state.value === quizzes.prop3} onChange={handleChange}/>
                <Checkbox radio label={quizzes.prop4} value={quizzes.prop4} checked={state.value === quizzes.prop4} onChange={handleChange}/>
                <Form.Button color='teal' type='submit' >Valider</Form.Button>
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