Rails.application.routes.draw do
  root 'login#index'

  post 'auth' => 'login#authenticate'

  namespace :api do
    get 'books' => 'books#index'
  end
end
