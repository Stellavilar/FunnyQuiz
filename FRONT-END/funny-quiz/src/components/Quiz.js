import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router';
import { Segment, Header, Checkbox } from 'semantic-ui-react';

const Quiz = () => {
    /**Handle checkbox */
    const [ state, setState] = useState({});
    const handleChange = (e, { value }) => setState({value});
    

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

    const getQuiz = quiz.map((quizzes, index) => 
        <Segment key={quizzes.id}>
            <li>{quizzes.question}</li>
            <Checkbox radio label={quizzes.prop1} value={quizzes.prop1} checked={state.value === quizzes.prop1} onChange={handleChange} />
            <Checkbox radio label={quizzes.prop2} value={quizzes.prop2} checked={state.value === quizzes.prop2} onChange={handleChange}/>
            <Checkbox radio label={quizzes.prop3} value={quizzes.prop3} checked={state.value === quizzes.prop3} onChange={handleChange}/>
            <Checkbox radio label={quizzes.prop4} value={quizzes.prop4} checked={state.value === quizzes.prop4} onChange={handleChange}/>
        </Segment>  
    );
    
    return (
        <div className="quiz">
            <Header>Questions</Header>
            {getQuiz}
        </div>
    );
};

export default Quiz;