class Api::ReviewsController < ApplicationController

  def create
    begin
      Review.create(review_params)
      render json: { status: 'success', message: 'レビューを投稿しました。' }
    rescue
      render json: { status: 'error', message: 'レビューの投稿に失敗しました。' }
    end
  end

  private

  def review_params
    params.require(:review).permit(:book_id, :user_id, :content, :point)
  end

end
