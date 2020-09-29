import React from 'react';
import { Link } from 'react-router-dom';
import { Slide } from 'react-slideshow-image';
import 'react-slideshow-image/dist/styles.css'


const Slides = ({category}) => {
    const subCategories = category.map((cat, index) => 
        <div className="each-slide" key={cat.id} >
            <Link to={`/classifiedQuiz/${cat.id}`}>
                <div className ="carousel" style={{'height' : '460px' , 'borderRadius' : '15px'}}>
                    <p style={{color: cat.color}}>{cat.title}</p>
                </div>
            </Link>
        </div>
    )
    return (
        <div className='slides'>
            <Slide>
                  {subCategories} 
            </Slide>
        </div>
    )
};

export default Slides;