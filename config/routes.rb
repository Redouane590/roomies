Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/redirect', to: 'pages#redirect', as: 'redirect'
  get '/callback', to: 'pages#callback', as: 'callback'
end
