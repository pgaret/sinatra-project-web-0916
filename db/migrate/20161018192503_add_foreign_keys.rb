class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :user_restaurants, :users
    add_foreign_key :user_restaurants, :restaurants
  end
end
