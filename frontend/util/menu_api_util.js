export const fetchMenus = () => {
    return $.ajax({
        url:'/api/menus',
        method: "GET"
    });
};

export const fetchMenu = id => {
    return $.ajax({
        url:'/api/menus/${id}',
        method: "GET"
    });
};


export const createMenus = menu => {
    return $.ajax({
        url:'/api/menus',
        method: "POST",
        data: {menu: menu}
    })
};

export const updateMenu = menu => {
    return $.ajax({
        url:'/api/menus/${menu.id}',
        method: "POST",
        data: {menu}
    })
};

export const deleteMenu = id => {
    return $.ajax({
        url: '/api/menus/${menu.id}',
        method: "DESTROY"
    })
};