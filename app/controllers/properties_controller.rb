class PropertiesController < ApplicationController
  before_action :check_profile
  # before_action :authenticate_user!, :except => [:show]
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @order = Order.new
  end

  def favourite
    @property = Property.find(params[:property_id])
    @favourite = Favourite.create(user_id: current_user.id, property_id: params[:property_id])
    
  end

  def unfavourite
    @property = Property.find(params[:property_id])
    @favourite = Favourite.where(user_id: current_user.id, property_id: @property.id).first
    @favourite.destroy
  end

  # GET /properties/new
  def new
    if current_user.role == "agent"
      @property = Property.new
    else
      redirect_to(request.referer)
    end
  end

  # GET /properties/1/edit
  def edit
  end

  # post /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:name,:description, :size, :price, :amenities, :location, :property_type, :bedrooms, :bathrooms, :parking)
  end
end
