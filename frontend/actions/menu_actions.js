import * as MenuApiUtil from "../util/menu_api_util";

// Reg Action Creators
export const RECEIVE_ALL_MENUS = "RECEIVE_ALL_MENUS";
export const RECEIVE_MENU = "RECEIVE_MENU";
export const REMOVE_MENU = "REMOVE_MENU";
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
export const fetchMenus = () => dispatch => {
    return MenuApiUtil.fetchMenus()
    .then(menus => dispatch(receiveMenus(menus)))
};

export const fetchMenu = id => dispatch => {
    return MenuApiUtil.fetchMenu(id)
    .then(menu => dispatch(receiveMenu(menu)))
};
export const createMenu = menu  => dispatch => {
    return MenuApiUtil.fetchMenu(menu)
    .then(menu => dispatch(receiveMenu(createdPost())))
};

export const updateMenu = menu =>dispatch => {
    return MenuApiUtil.createMenu(menu)
    .then(updatedMenu => dispatch(receiveMenu(updatedPost())))
};
export const deleteMenu =id  => dispatch => {
    return MenuApiUtil.deletePost(id)
    .then(()) => dispatch(removeMenu(id)))
};