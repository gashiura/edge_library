class FavoriteDecorator < Draper::Decorator
  delegate_all
  decorates_association :book

  def book_name
    return object.book.name[0...35] << '.....'  if object.book.name.length >= 35
    return object.book.name
  end
end
