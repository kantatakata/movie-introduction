class Favorite < ApplicationRecord
  
  belongs_to :customer
  belongs_to :theater
  validates_uniqueness_of :theater_id, scope: :customer
  
end
