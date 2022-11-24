class Public::FavoritesController < ApplicationController
  #いいね追加
  def create
    theater = Theater.find(params[:theater_id])
    @favorite = current_user.favorites.new(theater_id: theater.id)
    @favorite.save
    render 'replace_btn'
  end
  #いいね削除
  def destroy
    theater = Theater.find(params[:theater_id])
    @favorite = current_user.favorites.find_by(theater_id: theater.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
