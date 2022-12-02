Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :colocations do
    # resources :user_colocations, only: [:new, :create]
    resources :lists, except: [:home] do
      resources :items
    end
    resources :notes, except: [:home]
    resources :chatrooms, only: [:show] do
      resources :messages, only: :create
    end
    resources :events, except: [:home]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
# sortir edit et update des routes param de coloc
