class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_access_control_headers
  skip_before_action :authenticate_user!
  respond_to :json

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if registered_application == nil
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = registered_application.events.build(events_param)
      if @event.save
        render json: "Event create", status: :created
      else
        render json: {errors: @event.errors}, status: :unprocessable_entity
      end
    end
  end

  def preflight
    head 200
  end

  private
  def events_param
    params.require(:event).permit(:name)
  end

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end
end
