class TouchPandemicEventJob < ApplicationJob
  queue_as :touch_pandemic_event

  def perform(pandemic)
    pandemic_event = PandemicEvent.manufacture(pandemic)

    DeliveryBoy.deliver(pandemic_event.to_json, topic: pandemic_event.topic)
  end
end
