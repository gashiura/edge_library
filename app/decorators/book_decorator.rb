class BookDecorator < Draper::Decorator
  delegate_all
  decorates_associations :reviews

  def status
    return '貸出可' if object.rentals.blank?

    object.rentals.each do |rental|
      return '貸出中' if rental.return_date.nil?
    end

    return '貸出可'
  end

  def image_url
    return "http://edge-library-local-bucket.s3-website-ap-northeast-1.amazonaws.com/images/books/#{object.id}.jpeg"
  end

end
