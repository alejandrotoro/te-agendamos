class SchedulesController < ApplicationController
  
  def new
    @categories = Category.all
    render :partial => "schedules/new"
  end
  
  def send_reminder(email, event, html)
    ContactMailer.reminder(email, event, html).deliver
  end
  
  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        
        scheduler = Rufus::Scheduler.start_new
        # Get the difference between reminder date and now
        # The timezones are differente it must be fixed
        # time is in minutes, the 300 is the difference between timezones
        time = ((@schedule.reminder_date.to_datetime - DateTime.now) * 24 * 60).to_i
        #scheduler.in "#{time}m" do
        #  ContactMailer.reminder(current_user.email, params[:schedule][:title], nil).deliver
        #end
        
        ContactMailer.delay({:run_at => @schedule.reminder_date.to_datetime}).reminder(current_user.email, @schedule.title, nil)
        
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
