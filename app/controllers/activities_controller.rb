class ActivitiesController < ApplicationController
  respond_to :html

  def dashboard
    @categories = Category.all
    @location = session[:location]

    redirect_to(locations_path, :notice => 'You must select a location') and return if session[:location].nil?

    respond_with @categories, @location
  end

  def create
    @activity = Activity.new(params[:activity])

    if @activity.save
      redirect_to dashboard_activities_path, :notice => "You successfully tracked a #{@activity.category.name} activity."
    else
      flash[:error] = 'There was a problem tracking that activity. Please try again.'
      render :dashboard
    end
  end
end
