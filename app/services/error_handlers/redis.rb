module ErrorHandlers
  module Redis
    def self.included(klazz)
      rescue_from Redis::ConnectionError, with: :connection_error
      rescue_from Redis::CannotConnectError, with: :cannot_connect_error
    end

    private

    def connection_error(exception)
      logger.error "Redis::ConnectionError => #{exception.message}"
    end

    def cannot_connect_error(exception)
      logger.error "Redis::CannotConnectError => #{exception.message}"
    end
  end
end
