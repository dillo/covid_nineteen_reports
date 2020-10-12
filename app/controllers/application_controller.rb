class ApplicationController < ActionController::Base
  def cache(key)
    if block_given?
      Rails.cache.fetch(key) { yield }
    end
  end
end
