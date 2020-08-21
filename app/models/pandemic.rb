class Pandemic < ApplicationRecord
  has_many :data_urls, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
