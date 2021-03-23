class Item < ActiveRecord::Base
  validates: menu_id, name, ingredients, presence: true

  belongs_to :menu
end
