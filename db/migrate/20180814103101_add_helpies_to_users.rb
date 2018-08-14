class AddHelpiesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :helpies, :integer
  end
end
