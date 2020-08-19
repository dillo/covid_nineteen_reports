class Pandemic < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
