Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories
      resources :right_answers
    end
  end
end
