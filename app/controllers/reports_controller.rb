class ReportsController < ApplicationController
  def create
    pandemic = Pandemic.find(reports_params[:pandemic_id])
    #fire kafka event
    redirect_to pandemic_url(pandemic)
    flash[:notice] = "Report for #{pandemic.name} is being generated and will be available shortly."
  end

  private

  def reports_params
    params.require(:report).permit(:pandemic_id)
  end
end
