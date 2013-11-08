Larpwriter::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  root to: "pages#home"

  resources :larps do
    resources :pcs
    resources :organizers
  end
end
