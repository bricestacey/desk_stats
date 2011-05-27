class LocationsController < ApplicationController
  respond_to :html

  def index
    @locations = Location.all

    respond_with @locations
  end

  def select
    @location = Location.find(params[:id])

    if @location
      session[:location] = @location
      redirect_to dashboard_activities_path, :notice => "You have selected the #{@location.name} location."
    else
      flash[:error] = 'There was an error selecting a location. Please try again.'
      render :index
    end
  end
end
