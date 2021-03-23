class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :menu_id, null: false
      t.string :name, null: false
      t.text :ingredients, null: false
    end
  end
end
