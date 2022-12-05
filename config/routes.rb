Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    get 'sign_in', to: 'sessions#new', as: :new_user_session
    get 'sign_out', to: 'sessions#destroy', as: :destroy_user_session
  end
  root to: "pages#home"
  get '/redirect', to: 'pages#redirect', as: 'redirect'
  get '/callback', to: 'pages#callback', as: 'callback'
  get '/calendars', to: 'pages#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'pages#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'pages#new_event', as: 'new_event', calendar_id: /[^\/]+/
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

  get "calendar", to: "pages#calendar", as: :calendar
end
# sortir edit et update des routes param de coloc
