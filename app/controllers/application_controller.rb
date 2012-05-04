class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    if resource.is_a? Provider
      return provider_root_path
    elsif resource.is_a? User
      return user_root_path
    end
  end
end