import React from 'react';
import {BrowserRouter, Routes, Route} from "react-router-dom";
import './App.css';
import GlobalNavigationBar from './components/GlobalNavigationBar';
import Post_list from "./components/Post_list";
import Main from "./components/Main";

function App() {


  return (
    <div className="App">
      
      <BrowserRouter>
        <GlobalNavigationBar/>
        <Routes>
          <Route path="/" element={<Main/>}></Route>
          <Route path="/post/list" element={<Post_list/>}></Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
