require 'test_helper'

class TreesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tree = trees(:one)
  end

  test "should get index" do
    get trees_url, as: :json
    assert_response :success
  end

  test "should create tree" do
    assert_difference('Tree.count') do
      post trees_url, params: { tree: { address: @tree.address, botanical_name: @tree.botanical_name, common_name: @tree.common_name, coordinates: @tree.coordinates, dbh_trunk: @tree.dbh_trunk, geo_id: @tree.geo_id, geometry_type: @tree.geometry_type, name: @tree.name, struct_id: @tree.struct_id, tree_posit: @tree.tree_posit, x: @tree.x, y: @tree.y } }, as: :json
    end

    assert_response 201
  end

  test "should show tree" do
    get tree_url(@tree), as: :json
    assert_response :success
  end

  test "should update tree" do
    patch tree_url(@tree), params: { tree: { address: @tree.address, botanical_name: @tree.botanical_name, common_name: @tree.common_name, coordinates: @tree.coordinates, dbh_trunk: @tree.dbh_trunk, geo_id: @tree.geo_id, geometry_type: @tree.geometry_type, name: @tree.name, struct_id: @tree.struct_id, tree_posit: @tree.tree_posit, x: @tree.x, y: @tree.y } }, as: :json
    assert_response 200
  end

  test "should destroy tree" do
    assert_difference('Tree.count', -1) do
      delete tree_url(@tree), as: :json
    end

    assert_response 204
  end
end
