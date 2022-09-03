Rails.application.routes.draw do
  devise_for :users
  root 'page#home'
  resources :patients do
    resources :treatments
  end
end
