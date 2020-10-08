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
        pandemic_id: pandemic.id,
        sources: data_urls(pandemic)
      }
    }

    DeliveryBoy.deliver(event.to_json, topic: TOPIC)
  end

  private

  def data_urls(pandemic)
    pandemic.data_urls.each_with_object([]) { |url, acc| acc << url.to_hash }
  end
end
