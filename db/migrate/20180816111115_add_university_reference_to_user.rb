class AddUniversityReferenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user, :string
    add_reference :users, :university, foreign_key: true
  end
end
