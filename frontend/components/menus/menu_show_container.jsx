import { connect } from 'react-redux';
import MenuShow from './menu_show';
import { fetchMenu } from '../../actions/menu_actions';


const mapStateToProps = (state, ownProps) =>({

  menu: state.menus(ownProps.match.params.id)
});

const mapDispatchToProps = dispatch => ({
  fetchMenu: id => dispatch(fetchMenu(id))
});

export default connect(mapStateToProps,mapDispatchToProps)(MenuShow);
