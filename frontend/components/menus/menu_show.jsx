import React from 'react';
import { Link } from 'react-router-dom';


class MenuShow extends React.Component{
  componentDidMount(){
    this.props.fetchmenu(this.props.match.params.id);
  }
  render() {

    const { menu } = this.props;

    return (
      <div>
          <h1>{menu.chefs_name}</h1>
          <p>{menu.location}</p>
          <link to="/">Back to Index</link>
      </div>
    );
  }

}

export default MenuShow;
