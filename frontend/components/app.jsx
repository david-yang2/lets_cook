import React from "react";
import { Route, Switch } from "react-router-dom";

import MenuIndexContainer from "./menus/menu_index_container";
import MenuShowContainer from "./menus/menu_show_container";
import EditMenuFormContainer from "./menus/edit_menu_form_container";

// NB: this file is complete - you do not to write/edit anything!
const App = () => (
  <div>
    <h1>React 1</h1>
    <Switch>
      // route for the index container
      <Route exact path="/" component={MenuIndexContainer} />
      // route for the show container
      <Route exact path="/menus/:id" component={MenuShowContainer} />
      // route for the EditPostFormContainer
      <Route path="/menus/:id/edit" component={EditMenuFormContainer} />
    </Switch>
  </div>
);

export default App;
