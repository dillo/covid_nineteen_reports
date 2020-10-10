class CreateReportEventJob < ApplicationJob
  queue_as :create_report_event

  def perform(pandemic)
    pandemic_event = PandemicReportEvent.manufacture(pandemic)

    DeliveryBoy.deliver(pandemic_event.to_json, topic: pandemic_event.topic)
  end
end
