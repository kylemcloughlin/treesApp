class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :address
      t.string :name
      t.string :geometry_type
      t.integer :lat_coordinate
      t.integer :long_coordinate
      t.integer :geo_id
      t.integer :x
      t.integer :y
      t.integer :struct_id
      t.integer :tree_posit

      t.timestamps
    end
  end
end
