Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  registrations: "users/registrations",
  passwords: "users/passswords"
}
# ゲストログインのルーティング
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root :to => "homes#top"
  get "about" =>"homes#about"
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :theaters, only: [:index, :create, :show, :edit, :update]
  resources :theater_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  resources :genres, only: [:index, :create, :edit]


end
