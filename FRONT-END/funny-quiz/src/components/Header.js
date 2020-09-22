import React from 'react';
import { Link } from 'react-router-dom';
import { Dropdown, Menu } from 'semantic-ui-react';




const Header = ({tag, level}) => {
 
    const tags = tag.map((getTag, index) => 
        <Dropdown key={getTag.id} text={getTag.title} pointing='left' className='link item' style={{backgroundColor: getTag.color}}>
            <Dropdown.Menu>
                {level.map((getLevel, index) => 
                    {return <Link to={`/specificQuiz/${getTag.id}/level/${getLevel.id}`}> <Dropdown.Item key={getLevel.id} >{getLevel.title}</Dropdown.Item></Link>})}
            </Dropdown.Menu>
        </Dropdown>)
  
   return (
    <div className="head">
        <Menu>
            {tags}
        </Menu>
    </div>
)
         
    
};

export default Header;