class UsersController < ApplicationController
    def index
      @users = User.all
      @theater = Theater.new
    end
  
  
    def show
      @user = User.find(params[:id])
      @theaters = @user.theaters
      @theater = Theater.new
    end
  
    def edit
       @user = User.find(params[:id])
  
    end
    def update
       @user = User.find(params[:id])
       if @user.update(user_params)
         redirect_to user_path(@user), notice: "会員編集しました"
       else
         render "edit"
       end
    end
  
    private
    def user_params
      params.require(:user).permit(:name, :kana_name, :email, :encrypted_password, :profile_image)
    end
end