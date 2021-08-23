class CreateSavedSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_searches do |t|
      t.references :library, foreign_key: true
      t.string :name
      t.string :keyword
      t.integer :sort
      t.integer :filter

      t.timestamps
    end
  end
end
