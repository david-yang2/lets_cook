class AddChefsNameToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :chefs_name, :string, null: false
    add_column :menus, :location, :string, null: false
    remove_column :menus, :label
  end
end
