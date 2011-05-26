class LocationsController < ApplicationController
  respond_to :html

  def index
    @locations = Location.order(:created_at).page params[:page]

    respond_with @locations
  end

  def show
    @location = Location.find(params[:id])

    respond_with @location
  end

  def new
    @location = Location.new

    respond_with @location
  end

  def edit
    @location = Location.find(params[:id])

    respond_with @location
  end

  def update
    @location = Location.find(params[:id])
    @location.attributes = params[:location]

    if @location.save
      redirect_to @location, :notice => 'The location has successfully been updated.'
    else
      flash.now[:error] = 'There was a problem updating the location.'
      render :edit
    end
  end

  def create
    @location = Location.new(params[:location])

    if @location.save
      redirect_to @location, :notice => 'The location was successfully added.'
    else
      flash.now[:error] = 'There was a problem adding the location.'
      render :new
    end
  end

  def destroy
    @location = Location.find(params[:id])

    if @location.delete
      redirect_to locations_path, :notice => 'The location was successfully deleted.'
    else
      flash[:error] = 'There was a problem deleting the location.'
      redirect_to locations_path
    end
  end
end
