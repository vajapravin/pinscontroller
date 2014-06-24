GreenThumb::Application.routes.draw do
  resources :categories

  root to: "home#index"

  devise_for :users, :controllers => {:registrations => 'registrations'} do
    get 'logout' => 'devise/sessions#destroy'
  end

  resources :products

  resources :users do
    post "save_profile", :on => :collection
  end
  get "/user/profile" => "users#profile"

  resources :authentications, only: [:index, :create, :destroy]
  match '/auth/:provider/callback' => 'authentications#create', via: [:post, :get]

  namespace :api do
    resources :products do
      post 'vote_by'
    end
  end
end