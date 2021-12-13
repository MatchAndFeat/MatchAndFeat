module ApplicationHelper
  def current_user_has_liked?(likeable)
    likeable.likers.include?(current_user)
  end

end
