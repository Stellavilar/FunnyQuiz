import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router';
import { Segment, Header, Form, Checkbox } from 'semantic-ui-react';

const SubCatQuiz = () => {

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

    let {id} = useParams();
    const [ subCat, setSubCat ] =useState([]);
    const url = `http://localhost:1234/quizzes/subcategory/${id}`;
    const subCategories = () => {
        axios.get(
            url,
        )
        .then((res) => {
            setSubCat(res.data)
            console.log(res.data)
        
        })
        .catch((err) => {
            console.log(err)
        })

        return subCategories;
    };

    useEffect(subCategories, []);

    const getQuiz = subCat.map((subcateg, index) =>
        <Segment key={subcateg.id}>
            <li>{subcateg.question}</li>
        <Form
        onSubmit={handleSubmit}
        >
            <Checkbox radio label={subcateg.prop1} value={subcateg.prop1} checked={state.value === subcateg.prop1} onChange={handleChange} />
            <Checkbox radio label={subcateg.prop2} value={subcateg.prop2} checked={state.value === subcateg.prop2} onChange={handleChange}/>
            <Checkbox radio label={subcateg.prop3} value={subcateg.prop3} checked={state.value === subcateg.prop3} onChange={handleChange}/>
            <Checkbox radio label={subcateg.prop4} value={subcateg.prop4} checked={state.value === subcateg.prop4} onChange={handleChange}/>
            <Form.Button color='teal' type='submit' >Valider</Form.Button>
        </Form>
    </Segment> 
    )

    return (
        <div className='subcategories'>
            <Header as='h2'>Questions</Header>
            {getQuiz}
        </div>
    )

};

export default SubCatQuiz;