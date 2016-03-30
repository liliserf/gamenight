class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user 
    @user.update_attributes(user_params)
    redirect_to games_path, flash: {success: "Your profile has been successfully updated!"} 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
