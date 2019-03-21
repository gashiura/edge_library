class Api::FavoritesController < ApplicationController

  def index
    @favorites = FavoriteDecorator.decorate_collection(
      Favorite.where(user_id: params[:user_id])
    )
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

end
