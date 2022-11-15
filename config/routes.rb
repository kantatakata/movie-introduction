Rails.application.routes.draw do
  root :to => "homes#top"
  get "about" =>"homes#about"

  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions",
  passwords: "users/passswords"
}
# ゲストログインのルーティング
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:index, :show, :edit, :update]
  resources :theaters, only: [:index, :create, :show, :edit, :update] do
    resources :theater_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :genres, only: [:index, :create, :edit, :update]

  get "search" => "searches#search"
end
