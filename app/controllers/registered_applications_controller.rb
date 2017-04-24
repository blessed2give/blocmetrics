class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.registered_applications
  end

  def show
    @registered_application = current_user.registered_applications.find(params[:id])
  end

  def new
    @registered_application = current_user.registered_applications.new
  end

  def create
    @registered_application = current_user.registered_applications.new
    @registered_application.url = params[:registered_application][:url]

    if @registered_application.save
      flash[:notice] = "New app registered!"
      redirect_to @registered_application
    else
      flash[:alert] = "There was an error registering the app."
      render :new
    end
  end

  def destroy
    @registered_application = current_user.registered_applications.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.url}\" was successfully deleted!"
      redirect_to registered_applications_path
    else
      flash[:alert] = "There was an error deleteing the app."
      render :show
    end
  end
end
