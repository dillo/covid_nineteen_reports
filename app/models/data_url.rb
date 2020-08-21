class DataUrl < ApplicationRecord
  belongs_to :pandemic

  validates :source_name, presence: true
  validates :source_url, presence: true
  validates :data_type, presence: true
  validates :data_type, inclusion: { in: %w[json rss] }
end
