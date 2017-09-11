class UsersController < ApplicationController
  before_action :should_be_logged_in , only: [:index,:edit,:update,:destroy]
  before_action :correct_user , only: [:edit,:update]
  before_action :should_be_admin, only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  def new
    @user = User.new
  end
  def show
    # debugger
    @user = User.find_by(id: params[:id])
  end
  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = " Successfully Created Account "
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated your details "
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Deleted successfully"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def should_be_logged_in
    store_url
    if !logged_in?
      flash[:danger] = "Please log in to view te requested page"
      redirect_to login_url
    end
  end
  def correct_user
    user = User.find_by(id: params[:id])
    if user == current_user
      
    else
     flash[:warning] = "You can only edit your own details"
     redirect_to root_url 
    end
  end
  def should_be_admin
    redirect_to root_url unless current_user.admin?
  end
end
