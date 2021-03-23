class AddDishTypeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :dish_type, :string, null: false
    remove_column :items, :type
  end
end
