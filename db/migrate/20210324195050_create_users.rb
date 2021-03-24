class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.timestamps
    end

    # In the users table, make the username unique with an index
    add_index :users, :username, unique: true
  end
end
