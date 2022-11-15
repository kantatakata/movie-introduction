class TheatersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]
  def index
    @theaters = Theater.all
    @theater = Theater.new
    @user = current_user
    @genres = Genre.all

  end

  def create
    @theater = Theater.new(theater_params)
    @theater.user_id = current_user.id
    if @theater.save
       redirect_to theater_path(@theater), notice: "新規投稿しました"
    else
    @theaters = Theater.all
    @user = current_user
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
 
  def ensure_correct_user
    @theater = Theater.find(params[:id])
    unless @theater.user == current_user
      redirect_to theaters_path
    end
  end
end
