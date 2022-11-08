class TheaterComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :theater
end
