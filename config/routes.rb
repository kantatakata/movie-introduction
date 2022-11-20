Rails.application.routes.draw do
  
  #ゲストログインのルーティング
  devise_scope :customer do
  post '/customers/guest_sign_in', to: 'customers/sessions#new_guest'
  end
  
  # 管理者ログイン機能
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
} 
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'search' => 'homes#search', as: 'search'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  #新規登録、ログイン、パスワード機能
  devise_for :customers, controllers: {
   registrations: "customers/registrations",
   sessions: "customers/sessions",
   passwords: "customers/passswords"
}
  scope module: :public do
    root :to => "homes#top"
    get "about" =>"homes#about"
    #退会機能
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    
    #ユーザー、映画投稿、コメント、いいね機能
    resources :customers, only: [:index, :show, :edit, :update]
    resources :theaters, only: [:index, :create, :show, :edit, :update] do
      resources :theater_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      end
    
    #検索機能
    get "search" => "searches#search"
  end
end
