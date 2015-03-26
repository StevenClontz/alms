class AddHexIdToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :hex_id, :string
  end
end
