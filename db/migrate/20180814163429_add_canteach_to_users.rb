class AddCanteachToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :canteach, :string
  end
end
