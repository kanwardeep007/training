class EventsController < ApplicationController
  helper_method :current_user
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = Event.new()
  end

  def create
    
    event  = current_user.events.new(event_params)
    debugger
    if event.save
      redirect_to show_event_path(event)
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name,:location)
  end
end
