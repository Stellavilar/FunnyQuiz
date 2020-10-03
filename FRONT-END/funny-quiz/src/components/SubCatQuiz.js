import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router';
import { Segment, Header, Form, Checkbox } from 'semantic-ui-react';

const SubCatQuiz = () => {
    /**Check answer */
    const [ answ, setAnsw ] = useState([]);
    /**Show anecdote */
    const [ showWiki, setShowWiki ] = useState([]);
    /**Handle checkbox */
    const [ state, setState] = useState({});
    const handleChange = (e, { value }) => setState({value});

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

    let {id} = useParams();
    const [ subCat, setSubCat ] =useState([]);
  
    const subCategories = () => {
        axios.get
        (`quizzes/subcategory/${id}`)
        .then((res) => {
            setSubCat(res.data);      
        })
        .catch((err) => {
            console.log(err)
        })

        return subCategories;
    };

    useEffect(subCategories, []);

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

    return (
        <div className='quiz'>
            <Header as='h2'>Questions</Header>
            {getQuiz}
        </div>
    )

};

export default SubCatQuiz;
