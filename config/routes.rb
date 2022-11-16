Rails.application.routes.draw do
  root :to => "homes#top"
  get "about" =>"homes#about"
  #新規登録、ログイン、パスワード機能
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions",
  passwords: "users/passswords"
}
  #ゲストログインのルーティング
  devise_scope :user do
  post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  #退会機能
  get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
  
  #ユーザー、映画投稿、コメント、いいね機能
  resources :users, only: [:index, :show, :edit, :update]
  resources :theaters, only: [:index, :create, :show, :edit, :update] do
    resources :theater_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  #ジャンル機能
  resources :genres, only: [:index, :create, :edit, :update]
  #検索機能
  get "search" => "searches#search"
end
