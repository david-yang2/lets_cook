import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import configureStore from "./store/store";

console.log('asdf')

document.addEventListener("DOMContentLoaded", () =>{
    
    const root = document.getElementById("root");
    const store = configureStore();
    //ReactDOM.render(<Root store={store} />, root);
    ReactDOM.render(<h1>please work</h1>, root);
});

