class SessionsController < ApplicationController
  def new
  end
  def create
    # debugger
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #do something on a new session
      
      log_in(user)
      params[:session][:remember_me] == 1 ? remember(user) : forget(user)
      redirect_to_or_default user 
    else
      flash.now[:danger] = "Incorrect combo of password and username"
      render 'new'
    end
  end
  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
