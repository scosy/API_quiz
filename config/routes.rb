Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories
      resources :right_answers
      resources :questions
      resources :wrong_answers
      resources :users
      post '/login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'
    end
  end
end
