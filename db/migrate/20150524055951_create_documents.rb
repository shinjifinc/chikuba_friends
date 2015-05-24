class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :category_id
      t.text :contents

      t.timestamps null: false
    end
  end
end
