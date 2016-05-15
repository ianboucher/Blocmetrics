class EventsController < ApplicationController

  def index
    @reg_app = RegApp.find(params[:reg_app_id])
    @events = @reg_app.events.all.group_by(&:category)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event = assign_attributes(event_params)

    if @event.save
      flash[:notice] = "Event was updated successfully."
      redirect_to user_reg_app_event_path
    else
      flash[:alert] = "There was an error updating this event. Please try again."
      redirect_to user_reg_app_event_path
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      flash[:notice] = "Event was deleted successfully"
      redirect_to user_reg_app_events_path
    else
      flash[:alert] = "There was an erroy deleting this event. Please try again."
      redirect_to user_reg_app_event_edit_path
    end
  end

  def event_params
    params.require(:events).permit(:category, :action, :label, :value)
  end
end
