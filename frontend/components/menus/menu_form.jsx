import React from 'react';

class MenuForm extends React.Component{
  constructor(props){
    super(props)

    this.state = this.props.menu;

    this.handleSubmit = this.handleSubmit.bind(this);
  }


  update(field){
 
    return e => {

      this.setState({[field]: e.currentTarget.value});
    }
  }

  handleSubmit(){

    this.props.action(this.state)
  }
  render (){
    return(
      <form onSubmit={this.handleSubmit}>
        <h1> {this.props.formType} </h1>
        <label>Chefs Name
          <input
            type="text"
            value={this.state.chefs_name}

            onChange={this.update('chefs_name')}
          />
        </label>
        <label>Chef's Name
          <textarea
            value={this.state.location}
            onChange={this.update('location')}
          />
        </label>
        <input type="submit" value={this.props.formType} />
      </form>
    );
  }
}
export default MenuForm;
