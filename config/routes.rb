Rails.application.routes.draw do
  resources :treatementtypes
  devise_for :users
  root "page#home"
  resources :patients do
    # collection do
    #   post :index
    # end
    resources :treatments
  end
  get "search", to: "patients#search"
end
