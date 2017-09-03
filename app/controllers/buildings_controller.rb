class BuildingsController < ApplicationController
  before_action :authenticate_user!
  #after_action :verify_authorized

  def index

    authorize User

    @building = Building.order('buildings.id asc').all


  end

  def show

  @building = Building.find(params[:id])

    authorize Building

  end


  def new


    @building = Building.new

  end

  def edit
    @building = Building.find(params[:id])
    authorize Building

  end


  def create


    authorize Building

    @building = Building.new(secure_params)
    logger.debug "@toto is: #{@building}"


    if @building.save

        redirect_to new_building_path, success: 'Building as been created'
    else
        redirect_to buildings_path

    end

  end



  def update

    @building = Building.find(params[:id])

    authorize Building


    #@user.building_ids = params[:building_id]
    logger.debug "@toto is: #{@toto}"


    if @building.update_attributes(secure_params)

      redirect_to buildings_path, :notice => "Building updated ."
    else
      redirect_to buildings_path, :alert => "Unable to update Building."
   end
  end

  def destroy
    building = Building.find(params[:id])
    authorize Building
    building.destroy
    redirect_to buildings_path, :notice => "Building deleted."

  end


  private

  def secure_params
    params.require(:building).permit(:name, :description)

  end









end
