class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]
    def index
      @users = User.all
    end


    def show
      @user = User.find(params[:id])

    end

    def edit
       @user = User.find(params[:id])

    end
    def update
       @user = User.find(params[:id])
       if @user.update(user_params)
         redirect_to admin_user_path(@user), notice: "会員情報の編集に成功しました"
       else
         render "abmin_user_edit"
       end
    end

    private
    def user_params
      params.require(:user).permit(:name, :kana_name, :email, :introduction, :is_deleted)
    end

    def ensure_correct_user
      @user = User.find(params[:id])
    end

end
