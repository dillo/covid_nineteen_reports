require 'rails_helper'

RSpec.describe DataUrl, type: :model do
  describe '#valid?' do
    let(:data_url) { DataUrl.new(params) }

    context 'when no params' do
      let(:params) { {} }

      it 'must return false' do
        expect(data_url.valid?).to eq(false)
      end
    end

    context 'when params' do
      let(:params) do
        { source_name: 'foo', source_url: 'http://www.example.com/foo_1.json',
          data_type: 'json', description: 'DataUrl Description' }
      end

      it 'must return true' do
        expect(data_url.valid?).to eq(true)
      end

      it 'must increase count by 1' do
        expect { DataUrl.create!(params) }.to change(DataUrl, :count).by(1)
      end

      it 'must have a unique source name and url' do
        DataUrl.create!(params)
        new_data_url = DataUrl.new(params)
        new_data_url.valid?

        expect(new_data_url.errors.messages).to eq({
                                                     source_name: ['has already been taken'],
                                                     source_url: ['has already been taken']
                                                   })
      end
    end
  end

  describe 'has_many' do
    let(:params) do
      { source_name: 'foo', source_url: 'http://www.example.com/foo_1.json',
        data_type: 'json', description: 'DataUrl Description' }
    end
    let(:pandemic_params) do
      { name: 'Pandemic', description: 'Pandemic Description' }
    end

    it 'has pandemics' do
      data_url = DataUrl.create!(params)
      pandemic = Pandemic.create!(pandemic_params)
      data_url.pandemic_data_associations.create!(pandemic: pandemic)

      expect(data_url.pandemic_data_associations.count).to eq(1)
      expect(data_url.pandemics.count).to eq(1)
    end
  end
end
