class SchedulesController < ApplicationController
  
  def schedule_tooltip
    schedule = Schedule.find(params[:id])
    render :partial => "schedules/schedules_tooltip", :locals => { :schedule => schedule }
  end
  
end
