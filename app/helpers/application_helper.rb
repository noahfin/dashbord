module ApplicationHelper
  def gravatar_url(email)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}"
  end
end
