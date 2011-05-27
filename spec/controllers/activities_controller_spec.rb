require 'spec_helper'

describe ActivitiesController do

  describe "GET 'dashboard'" do
    it "should be successful" do
      get 'dashboard'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create'
      response.should be_success
    end
  end

end
