class TheaterComment < ApplicationRecord
  belongs_to :customer
  belongs_to :theater
  
  validates :comment, presence: true
end
