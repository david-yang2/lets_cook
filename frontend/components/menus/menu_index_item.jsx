import React from 'react';
import { Link } from 'react-router-dom';

const MenuIndexItem = (props) => {
    return (
      <li>
        <Link to={`/menus/${menus.id}`}>{menus.chefs_name}</Link>

        <Link to={`/menus/${menus.id}`/edit}>Edit</Link>

        <button onClick={() => menus.deteleMenu(menus.id)}></button>
    </li>
    );
};
export default MenuIndexItem;