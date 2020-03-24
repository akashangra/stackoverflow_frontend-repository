Rails.application.routes.draw do
  get 'sessions/new'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/edit/:id', to: 'users#edit',as: 'edit'
  post '/update/:id', to: 'users#update',as: 'update'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
