class Activity < ActiveRecord::Base
  belongs_to :location
  belongs_to :category

  validates_presence_of :location_id, :category_id
end
