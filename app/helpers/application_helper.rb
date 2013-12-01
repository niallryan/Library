module ApplicationHelper

  # http://teamtreehouse.com/library/build-a-simple-ruby-on-rails-application/designing-urls/refactoring-the-flash-code
  def flash_class(type)
    case type
      when :alert
        "alert-error"
      when :notice
        "alert-success"
      else
        ""
    end
  end

end
