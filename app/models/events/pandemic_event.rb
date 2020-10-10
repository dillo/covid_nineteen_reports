module Events
  class PandemicEvent
    attr_reader :pandemic, :name, :topic

    def self.manufacture(pandemic)
      new(pandemic)
    end

    def initialize(pandemic)
      @pandemic = pandemic
      @name = 'Pandemic Report'
      @topic = 'generate_report'
    end

    def to_json
      Oj.dump({
        name: name,
        data: {
          pandemic_name: pandemic.name,
          pandemic_id: pandemic.id,
          sources: pandemic.presentable_data_urls
        }
      })
    end
  end
end
