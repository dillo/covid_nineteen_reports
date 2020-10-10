module ErrorHandlers
  module RedisErrors
    def self.included(klazz)
      klazz.class_eval do
        rescue_from Redis::ConnectionError, with: :connection_error
        rescue_from Redis::CannotConnectError, with: :cannot_connect_error
      end
    end

    private

    def connection_error(exception)
      logger.error "Redis::ConnectionError Thrown => #{exception.message}"
      render json: { error: "Connection Error!", status: 422 }
    end

    def cannot_connect_error(exception)
      logger.error "Redis::CannotConnectError Thrown => #{exception.message}"
      render json: { error: "Cannot connect to the Redis data store!", status: 500 }
    end
  end
end
