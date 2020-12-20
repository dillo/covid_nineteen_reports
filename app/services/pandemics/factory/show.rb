module Pandemics
  module Factory
    class Show
      attr_reader :cache_handler, :model, :pandemic_id

      def self.manufacture(pandemic_id)
        new(pandemic_id)
      end

      def initialize(pandemic_id)
        @pandemic_id = pandemic_id
        @model = Pandemic
        @cache_handler = Cache::Handler.new(cache_key)
      end

      def get
        cache_handler.fetch { model.includes(:data_urls).find(pandemic_id) }
      end

      def cache_key
        "pandemic-#{pandemic_id}"
      end
    end
  end
end
