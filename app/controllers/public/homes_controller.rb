class Public::HomesController < ApplicationController
  def top
    # いいね機能に紐付けてランキングを作成
    @theater_favorite_ranks = Theater.find(Favorite.group(:theater_id).order('count(theater_id) desc').limit(3).pluck(:theater_id))
  end
end
