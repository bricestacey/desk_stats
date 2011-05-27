class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'layouts/admin'
end
