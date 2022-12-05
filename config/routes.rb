Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/redirect', to: 'pages#redirect', as: 'redirect'
  get '/callback', to: 'pages#callback', as: 'callback'
  get '/calendars', to: 'pages#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'pages#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'pages#new_event', as: 'new_event', calendar_id: /[^\/]+/
end
