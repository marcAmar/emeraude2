class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.includes(:buildings).order('buildings.id asc').all
 
    authorize User
  end

  def show
    @user = User.find(params[:id])

    authorize @user
    @toto = 5
    logger.debug "@toto is: #{@user}"

  end

  def update
    @user = User.find(params[:id])

    authorize @user

    @user.building_ids=(params[:building_id])[:building_id]

    #@user.building_ids = params[:building_id]
    logger.debug "@toto is: #{@toto}"




    if @user.update_attributes(secure_params)

      redirect_to users_path, :notice => "User updated toto."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."

  end

  private

  def secure_params
    params.require(:user).permit(:role)

  end

  def secure_params_building
    params.require(:buildingable).permit(:building_id)

  end


end
