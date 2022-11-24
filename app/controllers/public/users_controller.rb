class Public::UsersController < ApplicationController
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
    end

    def edit
       @user = User.find(params[:id])
    end
    
    def update
       @user = User.find(params[:id])
      if current_user.name != "御客様"
        if @user.update(user_params)
          redirect_to users_path, notice: "会員編集しました"
        else
          render :edit
        end
      else
         redirect_to edit_user_path, alert: "ゲストユーザーは編集できません。"
      end
    end

    def unsubscribe
        @user = current_user
    end
  
    def withdraw
      @user = User.find(current_user.id)
      if current_user.id != "1"
      @user.update(is_deleted: true)
        reset_session
        redirect_to root_path, alert:  "退会処理を実行いたしました"
      else
        redirect_to confirm_unsubscribe_path
      end
    end

    private
    
    def user_params
      params.require(:user).permit(:name, :kana_name, :email, :encrypted_password, :profile_image, :introduction, :is_deleted)
    end

    def ensure_correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user)
      end
    end

end