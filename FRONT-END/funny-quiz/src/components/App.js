import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../styles/index.scss';


import Header from './Header';

const App = () => {
  /**Get tags */
  const [ tag, setTag] = useState([]);
  const url = 'http://localhost:1234/tags';
  const tags = () => {
        axios.get(
            url,
        )
        .then((res) => {
            setTag(res.data)
        })
        .catch((err) => {
            console.log(err)
        })
        return tags
    };
    useEffect(tags, []);

  return (
    <>
      <header className="header">
        <Header
         tag={tag}
         />
      </header>
      <main className="main">
     
      </main>
      <footer className="footer">
     
      </footer>
    </>
  );
}

export default App;
