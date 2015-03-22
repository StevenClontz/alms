class CreateWorkbooks < ActiveRecord::Migration
  def change
    create_table :workbooks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
