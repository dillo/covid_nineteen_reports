require 'rails_helper'

RSpec.describe PandemicDataAssociation, type: :model do
  let(:params) { { name: 'Pandemic', description: 'Pandemic Description' } }
  let(:data_url_params) do
    { source_name: 'foo', source_url: 'http://www.example.com/foo_1.json',
      data_type: 'json', description: 'DataUrl Description' }
  end

  describe 'associations' do
    it 'must belong to a pandemic and a data_url' do
      pandemic = Pandemic.create!(params)
      data_url = DataUrl.create!(data_url_params)
      pandemic.pandemic_data_associations.create!(data_url: data_url)

      expect(PandemicDataAssociation.first.pandemic).to eq(pandemic)
      expect(PandemicDataAssociation.first.data_url).to eq(data_url)
    end

    it 'must not delete data_url when pandemic is destroyed' do
      pandemic = Pandemic.create!(params)
      data_url = DataUrl.create!(data_url_params)
      pandemic.pandemic_data_associations.create!(data_url: data_url)

      Pandemic.first.destroy!

      expect(DataUrl.first).to eq(data_url)
      expect(data_url.pandemics).to eq([])
    end

    it 'must not delete pandemic when data_url is destroyed' do
      pandemic = Pandemic.create!(params)
      data_url = DataUrl.create!(data_url_params)
      pandemic.pandemic_data_associations.create!(data_url: data_url)

      DataUrl.first.destroy!

      expect(Pandemic.first).to eq(pandemic)
      expect(pandemic.data_urls).to eq([])
    end
  end
end
