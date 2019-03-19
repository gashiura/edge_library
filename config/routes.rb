Rails.application.routes.draw do
  root 'login#index'

  post 'auth' => 'login#authenticate'

  namespace :api do
    get 'books' => 'books#index'
    get 'rentals/:book_id/:user_id' => 'rentals#index'
    get 'reviews/:book_id' => 'reviews#index'
    get 'favorite/:book_id/:user_id' => 'books#index'
  end
end
