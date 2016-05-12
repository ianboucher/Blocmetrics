module ApplicationHelper

  def gravatar_url(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, class: "gravatar")
  end
end
