import { connect } from 'react-redux';
import MenuIndex from './menu_index';
import { fetchPosts, deletePost } from '../../actions/menu_actions';

const mapStateToProps = state => ({
    menus: Object.value(state.menus)
}),

const mapDispatchToProps = dispatch => ({

    fetchMenus: () => dispatch(fetchMenus()),
    deleteMenu: id => dispatch(deleteMenu(id));
});

export default connect(mapStateToProps, mapDispatchToProps)(MenuIndex);