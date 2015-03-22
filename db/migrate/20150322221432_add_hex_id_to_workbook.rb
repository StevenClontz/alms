class AddHexIdToWorkbook < ActiveRecord::Migration
  def change
    add_column :workbooks, :hex_id, :string
  end
end
