class CreateTrees < ActiveRecord::Migration[6.0]
  def change
    create_table :trees do |t|
      t.string :common_name
      t.string :botanical_name
      t.references :type, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.integer :dbh_trunk
      t.integer :address
      t.string :name

      t.timestamps
    end
  end
end
