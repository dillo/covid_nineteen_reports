require 'rails_helper'

RSpec.describe Pandemic, type: :model do
  describe '#valid?' do
    let(:pandemic) { Pandemic.new(params) }

    context 'when no params' do
      let(:params) { {} }

      it 'must return false' do
        expect(pandemic.valid?).to eq(false)
      end
    end

    context 'when params' do
      let(:params) { { name: 'Pandemic', description: 'Pandemic Description' } }

      it 'must return true' do
        expect(pandemic.valid?).to eq(true)
      end

      it 'must increase count by 1' do
        expect { Pandemic.create!(params) }.to change(Pandemic, :count).by(1)
      end

      it 'must not allow duplicate name' do
        Pandemic.create!(params)
        second = Pandemic.new(params)
        second.valid?

        expect(second.errors.messages[:name]).to eq(['has already been taken'])
      end
    end
  end

  describe 'has_many' do
    let(:params) { { name: 'Pandemic', description: 'Pandemic Description' } }
    let(:data_url_params) do
      { source_name: 'foo', source_url: 'http://www.example.com/foo_1.json',
        data_type: 'json', description: 'DataUrl Description' }
    end

    it 'has data_urls' do
      pandemic = Pandemic.create!(params)
      data_url = DataUrl.create!(data_url_params)
      pandemic.pandemic_data_associations.create!(data_url: data_url)

      expect(pandemic.pandemic_data_associations.count).to eq(1)
      expect(pandemic.data_urls.count).to eq(1)
    end
  end
end
