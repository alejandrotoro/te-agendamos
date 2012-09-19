class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_time_zone, :set_language

  def set_time_zone
    Time.zone = current_user.time_zone if current_user
  end

  def set_language
    available = %w{en es}
    l = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    if available.include?(l)
      I18n.locale = l
    else
      I18n.locale = :es
    end
  end
end