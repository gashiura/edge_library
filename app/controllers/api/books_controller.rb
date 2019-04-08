class Api::BooksController < ApplicationController

  def index
    search_string = params[:search_string]
    if search_string.blank?
      @books = BookDecorator.decorate_collection(Book.all)
    else
      @books = BookDecorator.decorate_collection(Book.where("name LIKE ?", "%#{search_string}%"))
    end
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @book = Book.find_by(id: params[:id]).decorate
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

end
