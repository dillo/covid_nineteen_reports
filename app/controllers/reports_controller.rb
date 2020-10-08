class ReportsController < ApplicationController
  def create
    pandemic = Pandemic.find(reports_params[:pandemic_id])

    begin
      CreateReportEventJob.perform_later(pandemic)
    rescue Redis::ConnectionError, Redis::CannotConnectError => e
      logger.error "REDIS::ERROR::#{e.message}"
    ensure
      redirect_to pandemic_url(pandemic)
      flash[:notice] = "Report for #{pandemic.name} is being generated and will be available shortly."
    end
  end

  private

  def reports_params
    params.require(:report).permit(:pandemic_id)
  end
end
