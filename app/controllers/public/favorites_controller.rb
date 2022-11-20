class Public::FavoritesController < ApplicationController
  def create
    theater = Theater.find(params[:theater_id])
    @favorite = current_customer.favorites.new(theater_id: theater.id)
    @favorite.save
    render 'replace_btn'
  end

  def destroy
    theater = Theater.find(params[:theater_id])
    @favorite = current_customer.favorites.find_by(theater_id: theater.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
