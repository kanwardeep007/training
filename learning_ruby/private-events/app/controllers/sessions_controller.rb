class SessionsController < ApplicationController
  def new
    
  end
  def create
    debugger
    if (user = User.find_by(name: params[:session][:name]))
      log_in(user)
      redirect_to show_path(user)
    else
      redirect_to show_path(user)
    end
  end
end
