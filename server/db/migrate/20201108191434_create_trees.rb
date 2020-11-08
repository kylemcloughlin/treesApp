class CreateTrees < ActiveRecord::Migration[6.0]
  def change
    create_table :trees do |t|
      t.string :common_name
      t.string :botanical_name
      t.integer :dbh_trunk
      t.string :geometry_type
      t.float :lat_coordinate
      t.float :long_coordinate
      t.integer :tree_posit
      t.integer :address
      t.string :name
      t.references :type, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :diameter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
