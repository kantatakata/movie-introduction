class TheatersController < ApplicationController
  def index
    @theaters = Theater.all
    @theater = Theater.new
    @user = current_user

  end

  def create
    @theater = Theater.new(theater_params)
    @theater.user_id = current_user.id
    if @theater.save
       redirect_to theater_path(@theater), notice: "新規投稿しました"
    else
    @theaters = Theater.all
    @user = current_user
       render "index"
    end
  end

  def show
    @theater = Theater.find(params[:id])

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
end