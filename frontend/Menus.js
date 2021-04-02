
// {/* <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.js"></script> */}
// constructor Menus function is going to receive a 
    // HTML jquery wrapped element as an argument


class MenusJs{
    constructor($el){

        // if we have a pointer to <div>, <div> will be our $el
        // .find allows us to search through an element (div in this case)
            // down its tree, at all its descendants
        // if you just pass in $ instead of $el
            // it will look through the entire DOM
        // if you .find on the element, it'll only at the element's children
        this.$menus = $el.find("ul");
        this.$form = $el.find("form");
        // when the form is submitted
            // call 
        // since submitMenus will be executed as an eventhandler
            // you have to bind it to this
            // so that when it's executed function style
            // it's still going to have this set to our instance of MenusJs
        this.$form.on("submit", this.submitMenus.bind(this));
    };

    // this will be an event handler, so it will be passed in an 
        // event as an argument
    submitMenus(event){

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
            data: this.$form.serialize_json(),

            // success callback
            // if this request is a success
                // execute this function
                // 200 for success
                // 400 for failure
            success: function(menu) {
                
                this.addMenu(menu);



                // const $menu = $("<li>").text(menu.chefs_name + ": " + menu.location);
                // this.$menus.append($menu);

                
                // this.clearForm();
            // },
            // error: function (error) {
            //     console.log(error)
            // },

            // remember to bind or else this. will refer to the global variable
            }.bind(this)
        });
    }

    addMenu(menu){
        // this should add the inputs to the list
        var $menu = $("<li>").text(menu.chefs_name + ": " + menu.location);
        this.$menus.append($menu);
    }
    // clearForm(){
    //     // set the values of type="text" to empty string
    //     // make sure to specificy the type
    //         // if you just leave it as input
    //             // you will clear the value for the submit button as well
    //     this.$form.find("input[type="text"]").val("");
    // }
}
export default MenusJs;