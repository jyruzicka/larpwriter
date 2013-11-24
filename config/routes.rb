Larpwriter::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: "pages#home"

  get "support"       => "pages#support"
  get "documentation" => "pages#documentation"
  get "forum"         => "pages#forum"

  resources :larps do
    resources :tags
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
    resources :memberships, only: [] do
      post :change_position, on: :member
    end
  end

  if Rails.env.development?
    mount MailsViewer::Engine => '/delivered_mails'
  end
end
