module LocationsHelper
  def current_location=(location)
    session[:location] = location
  end

  def current_location
    session[:location]
  end
end
