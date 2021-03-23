class Item < ActiveRecord::Base

  DISH_TYPE = [
    "Appetizer",
    "Main Course",
    "Dessert"
  ]
  #dn menu_id, name, ingredients should not be blank
  validates :menu_id, :name, :ingredients, :dish_type, presence: true
  validates :dish_type, inclusion:DISH_TYPE

  belongs_to :menu
end
