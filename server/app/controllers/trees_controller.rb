class TreesController < ApplicationController
  before_action :set_tree, only: [:show, :update, :destroy]

  # GET /trees
  def index
   puts 'hits backend'
    @trees = Tree.all

    render json: @trees
  end

  # GET /trees/1
  def show
    render json: @tree
  end

  # POST /trees
  def create
    @tree = Tree.new(tree_params)

    if @tree.save
      render json: @tree, status: :created, location: @tree
    else
      render json: @tree.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trees/1
  def update
    if @tree.update(tree_params)
      render json: @tree
    else
      render json: @tree.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trees/1
  def destroy
    @tree.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree
      @tree = Tree.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tree_params
      params.require(:tree).permit(:geo_id, :x, :y, :struct_id, :address, :name, :dbh_trunk, :tree_posit, :common_name, :botanical_name, :geometry_type, :coordinates)
    end
end
