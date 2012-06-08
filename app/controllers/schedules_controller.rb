class SchedulesController < ApplicationController
  
  def edit
    @categories = Category.all
    schedule = Schedule.find(params[:id])
    render :partial => "schedules/edit", :locals => { :schedule => schedule }, :layout => false
  end
  
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to dashboard_path, notice: 'El evento fue actualizado con exito.' }
        format.json { head :ok }
      else
        flash[:notice] = @schedule.errors.to_a.join(",").gsub(",", "<br\>")
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
end
