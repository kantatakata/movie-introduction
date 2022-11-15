class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]
    def index
      @users = User.all
      @theater = Theater.new
      @user = current_user
    end


    def show
      @user = User.find(params[:id])
      @theaters = @user.theaters
      @theater = Theater.new
      @genres = Genre.all

    end

    def edit
       @user = User.find(params[:id])

    end
    def update
       @user = User.find(params[:id])
       if @user.update(user_params)
         redirect_to users_path, notice: "会員編集しました"
       else
         render "edit"
       end
    end

    private
    def user_params
      params.require(:user).permit(:name, :kana_name, :email, :encrypted_password, :profile_image, :introduction)
    end

    def ensure_correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user)
      end
    end

end