class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      #dn t.(specify datatype)
      #dn :label would be either breakfast, lunch or dinner
      #dn null: false -> forces an entry, so every menu has to have a label
        t.string "label", null: false
    end
  end
end
