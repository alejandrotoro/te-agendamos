class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:login_and_register, :login, :register]
  def show
    @user = User.find(params[:id])
  end

  def login_and_register
    render :partial => "users/login_and_register"
  end
  
  def login
    render :partial => "devise/sessions/new", :locals => { :user => User }
  end

  def register
    render :partial => "devise/registrations/new", :locals => { :user => User }
  end
  
  def dashboard
    @user = current_user
    @schedules = Schedule.where(:user_id => @user.id).all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

end