class ChangeSavedSearchesDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column :saved_searches, :name, :string, null: false
    change_column :saved_searches, :keyword, :string, null: false
    change_column :saved_searches, :sort, :string, null: false
    change_column :saved_searches, :filter, :string, null: false
    change_column_default :saved_searches, :name, ''
    change_column_default :saved_searches, :keyword, ''
    change_column_default :saved_searches, :sort, ''
    change_column_default :saved_searches, :filter, ''
  end
end
