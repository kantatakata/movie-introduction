Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  root :to => "homes#top"
  get "about" =>"homes#about"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  

end
