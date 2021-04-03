import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import MenuForm from './menu_form';
import { createMenu } from '../../actions/menu_actions';

const mapStateToProps = state => ({
    menu: {
        // can be empty strings so it acts as a placeholder
        chefs_name: "",
        location: "",
      },
      formType: "Create Menu"
    });
    
    const mapDispatchToProps = dispatch => ({
      // remember it's shared b/t createMenu and editMenu containers
      action: menu => dispatch(createMenu(menu))
    });
    
export default connect(mapStateToProps, mapDispatchToProps)(MenuForm);