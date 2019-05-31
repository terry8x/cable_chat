module ApplicationHelper
  FLASH_CLASSES = { notice: 'success', alert: 'danger', warning: 'warning' }.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch(key.to_sym, key)
  end

  def gravatar_for(user, options = {})
    options[:alt] = user.name
    image_tag("https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{options.delete(:size) { 40 }}", options)
  end
end
