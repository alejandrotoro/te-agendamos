class SchedulesController < ApplicationController
  
  def edit
    @categories = Category.all
    schedule = Schedule.find(params[:id])
    render :partial => "schedules/edit", :locals => { :schedule => schedule }
  end
  
end
