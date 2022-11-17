# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  # ゲストログイン機能
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


protected  # If you have extra params to permit, append them to the sanitizer.

  def after_sign_in_path_for(resource)
      root_path
  end
  def after_sign_out_path_for(resource)
      root_path
  end


  # 退会しているかを判断するメソッド
  def user_state
    ## 【処理内容1】 入力されたnameからアカウントを1件取得
    # binding.pry
    @user = User.find_by(name: params[:user][:name])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    if @user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
         redirect_to new_user_registration_path, alert: 'お客様は退会済みです。申し訳ございませんが、再度新規登録してご利用ください。'
      end
    end
  end
end
