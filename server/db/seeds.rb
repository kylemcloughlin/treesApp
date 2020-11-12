# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "rgeo"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Dir.glob("#{Rails.root}/db/seeds/*.rb").each { |f| require f }


puts "begining to extract and seed data base........."
raw = RawTree.last(5000)
tr = Tree.destroy_all
d = Diameter.destroy_all
ty = Type.destroy_all
lo = Location.destroy_all



counter = 0
raw.each do |x|
  

    diameter = Diameter.find_or_create_by({
      dbh_trunk: x["bdh_trunk"],
    })
    type = Type.find_or_create_by({
      common_name: x["common_nam"],
      botanical_name: x["botanical_"],
    })

    location = Location.find_or_create_by ({
                                            address: x["address"],
                                            name: x["name"],
                                            geo_id: x["geo_id"],
                                            x: x["x"],
                                            y: x["y"],
                                            struct_id: x["structid"],
                                          })
factory = RGeo::GeoJSON::EntityFactory.instance
feature = factory.feature x["geometry"]
hash = RGeo::GeoJSON.encode feature

# puts " dbh: #{x["dbh_trunk"]}"
# puts " addy: #{x["address"]}"
# puts " name: #{x["name"]}"
# puts " tree pos: #{x["tree_posit"]}"
# puts " GEO ID: #{x["geo_id"]}"
# puts " STRUCT ID: #{x["structid"]}"
# puts " X: #{x["x"]}"
# puts " Y: #{x["y"]}"

puts "lat: #{hash["geometry"]["coordinates"][0]}"
puts "long: #{hash["geometry"]["coordinates"][1]}"

    tree = Tree.create({
      common_name: x["common_nam"],
      botanical_name: x["botanical_"],
      dbh_trunk: x["dbh_trunk"],
      address: x["address"],
      name: x["name"],
      tree_posit: x["tree_posit"],
      lat: hash["geometry"]["coordinates"][0],
      long: hash["geometry"]["coordinates"][1],
      type: type,
      location: location,
      diameter: diameter,
    })
    puts "@@@@@@@@@"
    puts tree.id
    puts tree.common_name
    puts "counter#{counter}"
    counter = counter + 1
    puts "counter#{counter}"
    puts "@@@@@@@@@"
  end

  puts "finished!!!"
