class PandemicDataAssociation < ApplicationRecord
  belongs_to :pandemic
  belongs_to :data_url
end
