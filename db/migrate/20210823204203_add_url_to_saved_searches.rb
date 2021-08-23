class AddUrlToSavedSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :saved_searches, :url, :string, null: false, default: ''
  end
end
