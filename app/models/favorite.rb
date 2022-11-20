class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :theater
  validates_uniqueness_of :theater_id, scope: :user
  
end
