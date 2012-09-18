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
  
  def edit
    @user = current_user
    render :partial => "users/edit", :locals => { :user => @user }
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to dashboard_path, notice: 'Tu informacion fue actualizada con exito.' }
        format.json { head :ok }
      else
        flash[:notice] = @user.errors.to_a.join(",").gsub(",", "<br\>")
        format.html { render :partial => "users/edit", :locals => { :user => @user } }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end