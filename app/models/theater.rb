class Theater < ApplicationRecord
  
  has_many :theater_comments
  has_many :favorites
  belongs_to :user
  belongs_to :genre
end
