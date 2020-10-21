class Pandemic < ApplicationRecord
  has_many :pandemic_data_associations, dependent: :destroy
  has_many :data_urls, through: :pandemic_data_associations

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def present_data_urls
    data_urls.each_with_object([]) { |data_url, acc| acc << data_url.to_hash }
  end
end
