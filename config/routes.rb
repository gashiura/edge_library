Rails.application.routes.draw do
  root 'homes#index'

  namespace :api do
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    get 'books' => 'books#index'
    get 'books/:id' => 'books#show'

    get 'rentals/:user_id' => 'rentals#index'
    get 'rentals/show/:id' => 'rentals#show'
    post 'rentals' => 'rentals#create'
    put 'rentals/return/:id' => 'rentals#return_book'

    post 'reviews' => 'reviews#create'

    get 'favorites/:user_id' => 'favorites#index'
    get 'favorites/exists/:book_id/:user_id' => 'favorites#exists?'
    post 'favorites' => 'favorites#create'
    delete 'favorites/:book_id/:user_id' => 'favorites#destroy'
  end
end
