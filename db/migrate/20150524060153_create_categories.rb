class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :ubic_category_id
      t.string :name

      t.timestamps null: false
    end
  end
end
