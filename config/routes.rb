Larpwriter::Application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :users
  root to: "pages#home"

  resources :larps do
    resources :groups
    resources :pcs
    resources :npcs
    resources :players
    resources :npc_players
    resources :organizers
    resources :documents
    resources :relationships, only: [] do
      get  :missing,         on: :collection
      post :change_position, on: :member
    end
  end
end
