module Pandemics
  module Factory
    class Index
      CACHE_KEY = 'all-pandemics'

      attr_reader :cache_handler, :model

      def self.manufacture
        new
      end

      def initialize
        @model = Pandemic
        @cache_handler = Cache::Handler.new(CACHE_KEY)
      end

      def get
        cache_handler.fetch { model.all.to_a }
      end
    end
  end
end
