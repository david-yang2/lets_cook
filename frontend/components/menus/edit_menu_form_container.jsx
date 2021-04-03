import React from 'react';
import { connect } from 'react-redux';
import MenuForm from './menu_form';
import { fetchMenu, updatemenu } from '../../actions/menu_actions';

class EditMenuForm extends React.Component {
    componentDidMount(){
        this.props.fetchMenu(this.props.match.params.menuId)
    }

    render(){
        const {action, formType, menu} = this.props;

        if (!menu) return null;
        return (
          <MenuForm
            action={action}
            formType={formType}
            menu={menu} />
        );
      }
    }

const mapStateToProps = (state, ownProps) => ({

    menu: state.menus[ownProps.match.params.menuId],
    formType: "Update menu"
    
});
    
const mapDispatchToProps = dispatch => ({

    action: menu => dispatch(updateMenu(menu)),

    fetchMenu: menuId => dispatch(fetchMenu(menuId))
});
    
export default connect(mapStateToProps,mapDispatchToProps)(EditMenuForm);