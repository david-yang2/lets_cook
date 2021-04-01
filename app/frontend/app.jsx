import MenusJs from './Menus.js';


// jquery ready document callback
// by using $ and passing a function as an argument
    // this will execute the function as soon as the document is loaded
$(function(){
    // look through the DOM in the index.html.erb file where
        // class = "chefs" => <div class='chefs'>
    // all elements of 'chefs' should be passed in as an argument
    const MenusJs($('.chefs'));

});