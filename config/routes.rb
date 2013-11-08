Larpwriter::Application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :larps do
    resources :pcs
    resources :organizers
  end
end
