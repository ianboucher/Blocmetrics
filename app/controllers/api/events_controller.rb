class API::EventsController < ApplicationController

  # In production, app would be made more secure by giving CSRF token client code
  # before submitting event, but for development in this project this needs to be
  # disabled.
  skip_before_action :verify_authenticity_token

  before_action :set_access_control_headers

  # Configure CORS to ensure cross-origin requests will be permitted
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def preflight
    head 200
  end

  # Find the reg_app that matches the source of the API request.
  def create
    @reg_app = RegApp.find_by(url: request.env['HTTP_ORIGIN'])

    if @reg_app.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    end

    @event = @reg_app.events.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: { errors: @event.errors }, status: :unprocessable_entity
    end
  end

private

  def event_params
    params.require(:event).permit(:category, :action, :label, :value)
  end
end
