class AddBuildingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :building, :integer
  end
end
