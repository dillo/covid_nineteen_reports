class DataUrl < ApplicationRecord
  has_many :pandemic_data_associations, dependent: :destroy
  has_many :pandemics, through: :pandemic_data_associations

  validates :source_name, presence: true, uniqueness: true
  validates :source_url, presence: true, uniqueness: true
  validates :data_type, presence: true
  validates :data_type, inclusion: { in: %w[json rss] }

  def to_hash
    {
      name: source_name,
      url: source_url,
      type: data_type
    }
  end
end
