class CreateReportEventJob < ApplicationJob
  NAME = 'Pandemic Report'
  TOPIC = 'generate_report'

  queue_as :create_report_event
  sidekiq_options retry: false

  def perform(pandemic)
    event = {
      name: NAME,
      data: {
        pandemic_name: pandemic.name,
        pandemic_id: pandemic.id
      }
    }

    DeliveryBoy.deliver(event.to_json, topic: TOPIC)
  end
end
