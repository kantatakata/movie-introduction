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
       redirect_to theater.path(@theater), notice: "新規投稿しました"
    else
    @theaters = Theater.all
    @user = current_user
       render "index"
    end
  end

  def show
    @theater = Theater.find(parames[:id])
  end

  def edit
    @theater = Theater.find(parames[:id])
  end

  def update
    @theater = Theater.find(parames[:id])
    if @theater.update(theater_params)
       redirect_to theater.path(@theater), notice: "投稿を編集しました"
    else
       render "edit"
    end

  end

 private
 def theater_params
   params.require(:theater).permit(:title, :introduction)
 end
end
