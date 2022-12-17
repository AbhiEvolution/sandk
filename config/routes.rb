Rails.application.routes.draw do
  resources :treatementtypes
  devise_for :users
  root "page#home"
  resources :patients do
    get :today_appointment, on: :collection
    post :today_appointment,  on: :collection
    resources :treatments
  end
  get "search", to: "patients#search"
end
