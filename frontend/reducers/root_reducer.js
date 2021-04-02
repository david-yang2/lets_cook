import {combinedReducers} from 'redux';
import MenusReducer from './menus_reducer';

const RootReducer = combinedReducers({
    menus: MenusReducer
});

export default RootReducer;