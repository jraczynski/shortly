Shortly::Application.routes.draw do
  get 'l/:short_url', to: 'links#redirect', as: 'redirlink'
  get 's/:short_url', to: 'links#show', as: 'showlink'
  resources :links, :except => [:show] #no show by id to increase user link privacy
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root  'links#new'
  match '/signup',  to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
