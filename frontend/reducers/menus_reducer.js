import {
    RECEIVE_ALL_MENUS,
    RECEIVE_MENU,
    REMOVE_MENU,
} from '../actions/menu_actions';


const MenuReducer = (oldstate, action) =>{
    Object.freeze(oldState);


    let nextState = Object.assign({}, oldState);

    switch (action.type) {
        case RECEIVE_ALL_MENUS:
            return action.menus;

        case RECEIVE_MENU:
            nextState[action.menu.id = action.post];
            return nextState;

        case REMOVE_MENU:
            delete nextState(action.id);
            return nextState;
        default:
            return oldState;
    }
}

export default MenusReducer;