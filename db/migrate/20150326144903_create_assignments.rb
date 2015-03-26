class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.text :description
      t.integer :workbook_id
      t.timestamps
    end
  end
end
