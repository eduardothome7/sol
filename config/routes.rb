Rails.application.routes.draw do
  namespace :admin do
    resources :sites
  end
  get "welcome/index"
  devise_for :users

  root "welcome#index"
end
