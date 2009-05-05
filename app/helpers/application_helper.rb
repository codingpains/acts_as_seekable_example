# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(string)
    content_for(:title, string)
    string
  end

end
