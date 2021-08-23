class RemoveSavedSearches < ActiveRecord::Migration[5.2]
  def change
    drop_table :saved_searches
  end
end
