import * as MenuApiUtil from "../util/menu_api_util";

// Reg Action Creators

export const RECEIVE_ALL_MENUS = "RECEIVE_ALL_MENUS";
export const RECEIVE_MENU = "RECEIVE_MENU";
export const REMOVE_MENU = "RECEIVE_MENU";

const receiveMenus = menus => {
    return{
        type: RECEIVE_ALL_MENUS,
        menus
    }
};

const receiveMenu = menu => {
    return{
        type: RECEIVE_ALL_MENU,
        menu
    }
};

const removeMenu = id => {
    return{
        type: REMOVE_MENU,
        // double check this
        id
    }
};



// THUNK Action Creators
