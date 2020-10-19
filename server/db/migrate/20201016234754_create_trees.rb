class CreateTrees < ActiveRecord::Migration[6.0]
  def change
    create_table :trees do |t|
      t.integer :geo_id
      t.integer :x
      t.integer :y
      t.string :struct_id
      t.integer :address
      t.string :name
      t.integer :dbh_trunk
      t.integer :tree_posit
      t.string :common_name
      t.string :botanical_name
      t.string :geometry_type
      t.integer :lat_coordinate
      t.integer :long_coordinate

      t.timestamps
    end
  end
end
