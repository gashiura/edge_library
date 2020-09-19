class Api::FavoritesController < ApplicationController
  def index
    @favorites = FavoriteDecorator.decorate_collection(
      current_user.favorites.limit(20)
    )
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def exists?
    is_favorite = current_user.favorites.exists?(book_id: params[:book_id])
    render json: { exists: is_favorite }
  end

  def create
    current_user.favorites.create(favorite_params)
    render json: { status: 'success', message: 'お気に入りに登録しました。' }
  rescue
    render json: { status: 'error', message: 'お気に入り登録でエラーが発生しました。' }
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    if favorite&.destroy
      render json: { status: 'success', message: 'お気に入りから解除しました。' }
    else
      render json: { status: 'error', message: 'お気に入り解除でエラーが発生しました。' }
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:book_id)
  end
end
