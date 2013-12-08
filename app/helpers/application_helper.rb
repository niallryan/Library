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

  # http://teamtreehouse.com/library/advanced-social-features-in-ruby-on-rails/uploading-and-resizing-images/adding-avatars-2
  def profile_pic_link(user, image_options={}, html_options={})
    link_to(image_tag(user.profile_pic.url(:thumb), image_options), profile_path(user.profile_name))
  end

end
