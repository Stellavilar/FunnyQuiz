import React from 'react';
import logo from '../img/FUNNY QUIZ.jpg';
import { Dropdown, Menu, Search } from 'semantic-ui-react';



const Header = ({tag}) => {
    
    const tags = tag.map((getTag, index) => 
        <Dropdown key={getTag.id} text={getTag.title} pointing='left' className='link item' style={{backgroundColor: getTag.color}}>
            <Dropdown.Menu>
                <Dropdown.Item>Débutant</Dropdown.Item>
                <Dropdown.Item>Intermédiaire</Dropdown.Item>
                <Dropdown.Item>Expert</Dropdown.Item>
            </Dropdown.Menu>
        </Dropdown>)
  
   return (
    <div className="head">
        <div className="logo-area">
            <img src={logo} alt="Funny quiz logo"/>
            <p>Quizs marrants pour les petits et les grands!</p>
            <Search></Search>
        </div>
        <Menu>
            {tags}
        </Menu>
        
    </div>
)
         
    
};

export default Header;