class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
    before_action :ensure_correct_admin, only: [:edit, :update]
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
         render "edit", alert: "会員情報の編集ができませんでした"
       end
    end

    private

    def user_params
      params.require(:user).permit(:name, :kana_name, :email, :introduction, :is_deleted)
    end

    def ensure_correct_admin
      @user = User.find(params[:id])
    end

end
