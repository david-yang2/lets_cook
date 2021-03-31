
// constructor Menus function is going to receive a 
    // HTML jquery wrapped element as an argument

    const MenusJs = ($el) =>{

        // if we have a pointer to <div>, <div> will be our $el
        // .find allows us to search through an element (div in this case)
            // down its tree, at all its descendants
        // if you just pass in $ instead of $el
            // it will look through the entire DOM
        // if you .find on the element, it'll only at the element's children
        
        
        this.$menus = $el.find("ul");
        this.$forms = $el.find("form");
        
        // when the form is submitted
            // call 
        // since submitMenus will be executed as an eventhandler
            // you have to bind it to this
            // so that when it's executed function style
            // it's still going to have this set to our instance of MenusJs
        this.$forms.on("submit", this.submitMenus.bind(this));
    };
    
    // this will be an event handler, so it will be passed in an 
        // event as an argument
    const submitMenus = (event) => {

        // the browsers default action is 
            // submit form and make a HTML POST request
        // we dont want that, so we have to prevent that
        event.preventDefault();

        // make a new POST request using JavaScript
        // and it's not going to cause a redirect

        $.ajax({
            method: "POST",
            url: "/menus", 
            dataType: "json",

            // this basically sets the key value pairs you submitted
            data: this.$form.serialize(),

            // success callback
            // if this request is a success
                // execute this function
                // 200 for success
                // 400 for failure
            success: function() {
                alert("hooray it worked");
            }


        })
    }
    
    
    export default MenusJs;