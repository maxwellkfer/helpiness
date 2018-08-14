class AddCanhelpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :canhelp, :string
  end
end
