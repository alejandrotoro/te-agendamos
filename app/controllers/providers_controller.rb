class ProvidersController < ApplicationController
  before_filter :authenticate_provider!, :except => [:login_and_register, :login, :register]

  def login_and_register
    render :partial => "providers/login_and_register"
  end

  def login
    render :partial => "providers/sessions/new", :locals => { :provider => Provider }
  end

  def register
    render :partial => "providers/registrations/new", :locals => { :provider => Provider }
  end

  def dashboard
    @provider = current_provider
  end

end
