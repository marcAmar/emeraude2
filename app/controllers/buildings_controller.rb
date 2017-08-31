class BuildingsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @buildings = Building.order('buildings.id asc').all

    authorize User
  end

  def show
    @buildings = Building.find(params[:id])

    authorize User

  end

  def update
      @building = Building.find(params[:id])

    authorize @user

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
    authorize user
    building.destroy
    redirect_to buildings_path, :notice => "Building deleted."

  end



  private

  def secure_params
    params.require(:user).permit(:role)

  end

  def secure_params_building
    params.require(:building).permit(:id, :name, :description)

  end


end
