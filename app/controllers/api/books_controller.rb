class Api::BooksController < ApplicationController

  def index
    @books = BookDecorator.decorate_collection(Book.all)
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def show
    @book = Book.find_by(id: params[:id]).decorate
    render 'show', formats: 'json', handlers: 'jbuilder'
  end

end
