import React from 'react';
import MenuIndexItem from './menu_index_item';
//import CreateMenuFormContainer from './create_menu_form_container';

class MenuIndex extends React.Component{
    componentDidMount() {
        this.props.fetchMenus();
    }


    render() {
        const {menus, deleteMenu} = this.props;

        return (
            <div>
                <ul>
                    {
                    menus.map(menu => <MenuIndexItem
                                        menu={menu}
                                        deleteMenu={deleteMenu}
                                        key={menu.id}
                                        />
                            )   
                    }
                </ul>
            </div>
        );
    }
}
export default MenuIndex;