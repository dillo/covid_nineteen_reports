module Cache
  class Handler
    attr_reader :cache_key

    def initialize(cache_key)
      @cache_key = cache_key
    end

    def fetch
      if block_given?
        Rails.cache.fetch(cache_key) { yield }
      end
    end
  end
end

