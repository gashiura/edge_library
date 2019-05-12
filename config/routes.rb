Rails.application.routes.draw do
  root 'login#index'

  post 'authenticate' => 'login#authenticate'

  namespace :api do
    get 'books' => 'books#index'
    get 'books/show/:id' => 'books#show'

    get 'rentals/:user_id' => 'rentals#index'
    get 'rentals/show/:id' => 'rentals#show'
    put 'rentals/return/:id' => 'rentals#return_book'

    post 'reviews/create' => 'reviews#create'

    get 'favorites/:user_id' => 'favorites#index'
  end
end
