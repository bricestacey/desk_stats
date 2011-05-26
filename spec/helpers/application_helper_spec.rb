require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "#title" do
    it "should return Desk Stats if @title is not set" do
      title.should eq('Desk Stats')
    end

    it "should return Title | Desk Stats if @title is set" do
      @title = 'Some Title'
      title.should eq('Some Title | Desk Stats')
    end
  end

  describe "#action_items" do
    before(:each) do
      @action_items = {'Edit Location' => '/locations/1/edit', 'Delete Location' => '/locations/1'}
    end

    it "should convert @action_items into links" do
      r = action_items
      r.should have_link('Edit Location', :href => '/locations/1/edit')
      r.should have_link('Delete Location', :href => '/locations/1')
    end
  end

  describe "#breadcrumbs" do
    before(:each) do
      @breadcrumbs = {'Home' => '/', 'Locations' => '/locations'}
    end

    it "should convert @breadcrumbs into links" do
      r = breadcrumbs

      r.should have_link('Home', :href => '/')
      r.should have_link('Locations', :href => '/locations')
    end
  end
end

