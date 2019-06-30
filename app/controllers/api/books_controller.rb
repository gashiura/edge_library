class Api::BooksController < ApplicationController

  def index
    search_string = params[:search_string]
    current_page = params[:page].to_i
    per_page = params[:per_page].to_i
    @offset = per_page * (current_page - 1)

    if search_string.blank?
      @books = BookDecorator.decorate_collection(
        Book.all.limit(per_page).offset(@offset)
      )
      @total_count = Book.count
    else
      @books = BookDecorator.decorate_collection(
        Book.where("name LIKE ?", "%#{search_string}%").limit(per_page).offset(@offset)
      )
      @total_count = Book.where("name LIKE ?", "%#{search_string}%").count
    end

    @total_page = (@total_count / per_page.to_f).ceil

    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @book = Book.find_by(id: params[:id]).decorate
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

end
