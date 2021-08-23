class ChangeColumnNameSavedSearchesKeyword < ActiveRecord::Migration[5.2]
  def change
    rename_column :saved_searches, :keyword, :search
  end
end
