class AddUserIdToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :User_id, :integer
  end
end
