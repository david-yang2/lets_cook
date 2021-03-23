class Item < ActiveRecord::Base

  #dn menu_id, name, ingredients should not be blank
  validates: menu_id, name, ingredients, presence: true

  belongs_to :menu
end
