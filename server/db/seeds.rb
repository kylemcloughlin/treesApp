# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# $LOAD_PATH.unshift("/Users/kyle/code/practiceApps/trees/treesApp/server/db/seed_data.rb")
lib = File.expand_path("../../lib", __FILE__)
$:.unshift(lib)
require "seed_data"
# include TreeData

puts TreeData::Trees[0]["X"]
TreeData::Trees.each do |x|
  # Tree.create({
  #   geo_id: x["GEO_ID"],
  #   x: x["X"],
  #   y: x["Y"],
  #   struct_id: x["STRUCTID"],
  #   address: x["ADDRESS"],
  #   name: x["NAME"],
  #   dbh_trunk: x["DBH_TRUNK"],
  #   tree_posit: x["TREE_POSIT"],
  #   common_name: x["COMMON_NAM"],
  #   botanical_name: x["BOTANICAL_"],
  #   lat_coordinate: x["coordinates_lat"],
  #   long_coordinate: x["coordinates_long"],

  # })

  type = Type.find_or_create_by({
    common_name: x["COMMON_NAM"],
    botanical_name: x["BOTANICAL_"],
  })

  location = Location.find_or_create_by ({
                                          address: x["ADDRESS"],
                                          name: x["NAME"],
                                          geo_id: x["GEO_ID"],
                                          x: x["X"],
                                          y: x["Y"],
                                          struct_id: x["STRUCTID"],
                                        })
  tree = Tree.create({
    common_name: x["COMMON_NAM"],
    botanical_name: x["BOTANICAL_"],
    dbh_trunk: x["DBH_TRUNK"],
    address: x["ADDRESS"],
    name: x["NAME"],
    geometry_type: x["geometry_type"],
    lat_coordinate: x["coordinates_lat"],
    long_coordinate: x["coordinates_long"],
    tree_posit: x["TREE_POSIT"],
    type: type,
    location: location,
  })
  puts "@@@@@@@@@"
  puts tree.id
  puts tree.common_name
  puts "@@@@@@@@@"
end
