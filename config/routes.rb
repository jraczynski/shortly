Shortly::Application.routes.draw do
  get 'l/:short_url', to: 'links#redirect', as: 'redirlink'
  get 's/:short_url', to: 'links#show', as: 'showlink'
  resources :links, :except => [:show] #no show by id to increase user link privacy
  resources :users
  root  'static_pages#home'
  match '/signup',  to: 'users#new', via: 'get'
end
