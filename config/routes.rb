Rails.application.routes.draw do
  devise_scope :user do
	root to: 'users/sessions#new'
  end

  resources :courses do
    resources :lessons
    resources :surveys
  end

  config = ActiveAdmin::Devise.config
  config[:controllers][:sessions] = "users/sessions"
  devise_for :users, config
  ActiveAdmin.routes(self)
end