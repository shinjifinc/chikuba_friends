class CreateCompanyIdeas < ActiveRecord::Migration
  def change
    create_table :company_ideas do |t|
      t.string :company_name
      t.text :idea

      t.timestamps null: false
    end
  end
end
