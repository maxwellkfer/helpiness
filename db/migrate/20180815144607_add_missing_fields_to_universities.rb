class AddMissingFieldsToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :web_page, :string
    add_column :universities, :country, :string
    add_column :universities, :domain, :string
  end
end
