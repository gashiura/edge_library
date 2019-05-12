class Api::FavoritesController < ApplicationController

  def index
    @favorites = FavoriteDecorator.decorate_collection(
      Favorite.where(user_id: params[:user_id])
    )
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def create
    begin
      Favorite.create(favorite_params)
      render json: { status: 'success', message: 'お気に入りに登録しました。' }
    rescue
      render json: { status: 'error', message: 'お気に入りの登録でエラーが発生しました。' }
    end
  end

  def favorite_params
    params.require(:favorite).permit(:book_id, :user_id)
  end

end
