import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router';
import { Segment, Header, Checkbox } from 'semantic-ui-react';

const Quiz = () => {
    /**Get quiz by tag and level */
    let { tagId, levelId } = useParams;
    const [ quiz, setQuiz ] = useState ([]);
    const url = `http://localhost:1234/tags/4/levels/2`;

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
            <Checkbox label={quizzes.prop1} />
            <Checkbox label={quizzes.prop2} />
            <Checkbox label={quizzes.prop3} />
            <Checkbox label={quizzes.prop4} />
        </Segment>)
    
    return (
        <div className="quiz">
            <Header as='h2'>Quiz.theme</Header>
               {getQuiz}
        </div>
    );
};

export default Quiz;