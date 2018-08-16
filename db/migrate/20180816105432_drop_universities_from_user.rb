class DropUniversitiesFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :university, :string
  end
end
