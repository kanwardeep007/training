class UsersController < ApplicationController
  def new
    @user = User.new()
  end
  def create
    user = User.new(user_params)
    if user.save
      
      redirect_to show_url(user.id)
    else
      render 'new'
    end
  end
  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
