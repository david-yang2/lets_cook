import React from "react";
import { Route, Switch } from "react-router-dom";

import MenuIndexContainer from "./posts/post_index_container";
import MenuShowContainer from "./posts/post_show_container";
import EditMenuFormContainer from "./posts/edit_post_form_container";

// NB: this file is complete - you do not to write/edit anything!
const App = () => (
  <div>
    <h1>React 1</h1>
    <Switch>
      // route for the index container
      <Route exact path="/" component={MenuIndexContainer} />
      // route for the show container
      <Route exact path="/posts/:id" component={MenuShowContainer} />
      // route for the EditPostFormContainer
      <Route path="/posts/:id/edit" component={EditMenuFormContainer} />
    </Switch>
  </div>
);

export default App;
