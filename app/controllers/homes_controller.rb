class HomesController < ApplicationController
  def top
    # @theaters = Theater.order('id DESC').limit(4)
    # @genres = Genre.all
    @theater_favorite_ranks = Theater.find(Favorite.group(:theater_id).order('count(theater_id) desc').limit(3).pluck(:theater_id))

  end

  def about
  end


end
