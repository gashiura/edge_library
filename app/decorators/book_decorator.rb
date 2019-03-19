class BookDecorator < Draper::Decorator
  delegate_all

  def status
    available_books = object.rentals.select do |rental|
      rental.return_date.nil?
    end
    return available_books.empty? ? '貸出可' : '貸出不可'
  end

end
