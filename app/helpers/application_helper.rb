module ApplicationHelper
	def gravatar_for(user)
	  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	  image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	def bootstrap_class_for(flash_type)
    string_for(flash_type)[:class]
  end

  def string_for(flash_type)
    case flash_type.to_sym
    when :success, :notice
      { icon: 'check', class: 'alert-success' }
    when :error, :alert
      { icon: 'ban', class: 'alert-danger' }
    when :info
      { icon: 'info', class: 'alert-info' }
    else
      { icon: 'warning', class: 'alert-warning' }
    end
  end
end
