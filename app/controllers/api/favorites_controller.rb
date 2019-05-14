class Api::FavoritesController < ApplicationController

  def index
    @favorites = FavoriteDecorator.decorate_collection(
      Favorite.where(user_id: params[:user_id])
    )
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def exists?
    is_favorite = Favorite.exists?(book_id: params[:book_id], user_id: params[:user_id])
    render json: { exists: is_favorite }
  end

  def create
    Favorite.create(favorite_params)
    render json: { status: 'success', message: 'お気に入りに登録しました。' }
  rescue
    render json: { status: 'error', message: 'お気に入り登録でエラーが発生しました。' }
  end

  def destroy
    Favorite.delete(book_id: params[:book_id], user_id: params[:user_id])
    render json: { status: 'success', message: 'お気に入りから解除しました。' }
  rescue
    render json: { status: 'error', message: 'お気に入り解除でエラーが発生しました。' }
  end

  private

  def favorite_params
    params.require(:favorite).permit(:book_id, :user_id)
  end

end
