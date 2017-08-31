class CreateBuildingables < ActiveRecord::Migration[5.1]
  def change
    create_table :buildingables do |t|
      t.references :user, foreign_key: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
