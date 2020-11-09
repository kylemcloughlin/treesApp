class DiametersController < ApplicationController
  before_action :set_diameter, only: [:show, :update, :destroy]

  # GET /diameters
  def index
    @diameters = Diameter.all

    render json: @diameters
  end

  # GET /diameters/1
  def show
    render json: @diameter.trees
  end

  # POST /diameters
  def create
    @diameter = Diameter.new(diameter_params)

    if @diameter.save
      render json: @diameter, status: :created, location: @diameter
    else
      render json: @diameter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diameters/1
  def update
    if @diameter.update(diameter_params)
      render json: @diameter
    else
      render json: @diameter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diameters/1
  def destroy
    @diameter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diameter
      @diameter = Diameter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diameter_params
      params.require(:diameter).permit(:dbh_trunk, :trees_id)
    end
end