import React from 'react';
import {BrowserRouter, Routes, Route} from "react-router-dom";
import './App.css';
import GlobalNavigationBar from './components/GlobalNavigationBar';
import Post_list from "./components/Post_list";


function App() {


  return (
    <div className="App">
      <BrowserRouter>
        <GlobalNavigationBar/>
        <h1>메인페이지</h1>
        <Routes>
          <Route path="/post/list" element={<Post_list/>}></Route>
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
