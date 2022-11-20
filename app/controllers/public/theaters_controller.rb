class Public::TheatersController < ApplicationController
    before_action :authenticate_customer!
    before_action :ensure_correct_customer, only: [:edit, :update]
  def index
    @theaters = Theater.all
    @theater = Theater.new
    @customer = current_customer
    @genres = Genre.all

  end

  def create
    @theater = Theater.new(theater_params)
    @theater.customer_id = current_customer.id
    if @theater.save
       redirect_to theater_path(@theater), notice: "新規投稿しました"
    else
    @theaters = Theater.all
    @customer = current_customer
    @genres = Genre.all
       render "index"
    end
  end

  def show
    @theater = Theater.find(params[:id])
    @genres = Genre.all
    @theater_comment = TheaterComment.new
  end

  def edit
    @theater = Theater.find(params[:id])
  end

  def update
    @theater = Theater.find(params[:id])
    if @theater.update(theater_params)
       redirect_to theater_path(@theater), notice: "投稿を編集しました"
    else
       render :edit
    end

  end

 private
 def theater_params
   params.require(:theater).permit(:title, :introduction, :genre_id)
 end
 
  def ensure_correct_customer
    @theater = Theater.find(params[:id])
    unless @theater.customer == current_customer
      redirect_to theaters_path
    end
  end
end
