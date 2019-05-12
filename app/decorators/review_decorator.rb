class ReviewDecorator < Draper::Decorator
  delegate_all

  def content
    return object.content.gsub("\n", '<br>')
  end

  def created_at
    return object.created_at.strftime("%Y/%m/%d %H:%M")
  end

end
