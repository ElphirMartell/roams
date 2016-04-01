Rails.application.routes.draw do
  resources :courses do
    resources :lessons
  end

  config = ActiveAdmin::Devise.config
  config[:controllers][:sessions] = "users/sessions"
  devise_for :users, config
  ActiveAdmin.routes(self)
end