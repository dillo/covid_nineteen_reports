class ApplicationJob < ActiveJob::Base
  retry_on ActiveRecord::Deadlocked, wait: 5.seconds, attempts: 3
  retry_on Net::OpenTimeout, Timeout::Error, wait: :exponentially_longer, attempts: 10
  discard_on ActiveJob::DeserializationError
end
