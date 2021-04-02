import {combineReducers} from 'redux';
import MenusReducer from './menus_reducer';

const RootReducer = combineReducers({
    menus: MenusReducer
});

export default RootReducer;