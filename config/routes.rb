Rails.application.routes.draw do
  root 'searches#search'
  get '/search', to: 'searches#search'
  get '/auth', to: 'sessions#create'
  post '/search', to: 'searches#foursquare'
  get '/friends', to: 'searches#friends'

end
