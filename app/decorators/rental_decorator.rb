require 'time'

class RentalDecorator < Draper::Decorator
  delegate_all

  def checkout_date
    return object.checkout_date.strftime("%Y/%m/%d")
  end

  def return_due_date
    return object.return_due_date.strftime("%Y/%m/%d")
  end

  def overdue
    return Date.today > object.return_due_date
  end

  def book_url
    return "/book/#{object.book_id}"
  end
end
