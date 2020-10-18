class PandemicEvent
  attr_reader :pandemic, :name, :topic

  def self.manufacture(pandemic)
    new(pandemic)
  end

  def initialize(pandemic)
    @pandemic = pandemic
    @topic = 'touch_pandemic'
    @name = 'Touch Pandemic'
  end

  def to_json
    Oj.dump({
      name: name,
      data: {
        pandemic_id: pandemic.id,
        pandemic_name: pandemic.name,
        pandemic_description: pandemic.description,
        sources: pandemic.present_data_urls
      }
    })
  end
end
