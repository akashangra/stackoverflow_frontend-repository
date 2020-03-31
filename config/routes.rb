Rails.application.routes.draw do

  #creating a question
  get 'questions/index'
  get 'question/:id/content',to: 'questions#content',as: 'questions_content'
  get 'question/new',to: 'questions#new'
  post 'question/create',to: 'questions#create'
  get 'question/comment_button/:question_id',to: 'comments#comment_button', as: 'question_comment_button'
  get 'question/answer/:question_id',to: 'answers#answer', as: 'question_answer_button'

  #creating an answer
  post 'answer/:question_id',to: 'answers#create', as: 'answer_create'

  #creating a comments
  post 'comment/:commentable_type/:commentable_id',to: 'comments#create', as: 'comment_create'

  #votes
  post "/create_vote/:votable_type/:votable_id/:vote_sign",to: 'votes#create', as: 'vote_create'
  post "/update_vote/:id/:vote_sign",to: 'votes#update', as: 'vote_update'
  post "/delete_vote/:id",to: 'votes#destroy', as: 'vote_delete'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #update user
  get '/edit/:id', to: 'users#edit',as: 'edit'
  post '/update/:id', to: 'users#update',as: 'update'

  #login logout
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
