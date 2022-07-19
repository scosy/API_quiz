Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories
      resources :right_answers
      resources :questions
      resources :wrong_answers
    end
  end
end
