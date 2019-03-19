class Api::FavoritesController < ApplicationController

  def index(book_id, user_id)
    @favorite = Favorite.find_by(book_id: book_id, user_id: user_id)
    render 'index', formats 'json', handlers: 'jbuilder'
  end

end
