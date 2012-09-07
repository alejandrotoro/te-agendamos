class SchedulesController < ApplicationController
  
  def new
    @categories = Category.all
    render :partial => "schedules/new"
  end
  
  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        
        scheduler = Rufus::Scheduler.start_new
        # Get the difference between reminder date and now
        # The timezones are differente it must be fixed
        # time is in minutes, the 300 is the difference between timezones
        time = ((params[:schedule][:reminder_date].to_datetime - DateTime.now) * 24 * 60 + 300).to_i
        scheduler.in "#{time}m" do
          ContactMailer.reminder(current_user.email, params[:schedule][:title], nil).deliver
        end
        
        format.html { redirect_to dashboard_path, notice: 'El evento fue creado satisfactoriamente.' }
      else
        flash[:notice] = @schedule.errors.to_a.join(",").gsub(",", "<br\>")
        format.html { render :partial => "schedules/new" }
      end
    end
  end
  
  def edit
    @categories = Category.all
    schedule = Schedule.find(params[:id])
    render :partial => "schedules/edit", :locals => { :schedule => schedule }
  end
  
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to dashboard_path, notice: 'El evento fue actualizado con exito.' }
        format.json { head :ok }
      else
        flash[:notice] = @schedule.errors.to_a.join(",").gsub(",", "<br\>")
        format.html { render :partial => "schedules/edit", :locals => { :schedule => @schedule } }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
