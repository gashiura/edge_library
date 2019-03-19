require_relative '../../decorators/book_decorator.rb'

class Api::BooksController < ApplicationController

  def index
    @books = BookDecorator.decorate_collection(Book.all)
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def test
    return Book.find(1).decorate
  end

end
