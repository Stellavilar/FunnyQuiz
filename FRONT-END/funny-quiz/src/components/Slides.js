import React from 'react';
import { Slide } from 'react-slideshow-image';
import 'react-slideshow-image/dist/styles.css'


const Slides = ({category}) => {
    const subCategories = category.map((cat, index) => 
        <div className="each-slide" key={cat.id} >
                    <div className ="carousel" style={{'height' : '460px' , 'borderRadius' : '15px'}}>
                        <p>{cat.title}</p>
                    </div>
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