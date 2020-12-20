module Pandemics
  module Factory
    class New
      attr_reader :cache_handler, :pandemic, :data_urls

      def self.manufacture
        new
      end

      def initialize
        @pandemic = Pandemic.new
        @cache_handler = Cache::Handler.new(cache_key)
        @data_urls = cache_handler.fetch { DataUrl.all.to_a }
      end

      def get
        self
      end

      def cache_key
        'all-data_urls'
      end
    end
  end
end
