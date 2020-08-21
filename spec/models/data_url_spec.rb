require 'rails_helper'

RSpec.describe DataUrl, type: :model do
  describe '#valid?' do
    let(:pandemic) { Pandemic.create!(name: 'Pandemic', description: 'Pandemic Description') }
    let(:data_url) { pandemic.data_urls.create(params)}

    context 'when no params' do
      let(:params) { { source_name: '', source_url: '', data_type: '' } }

      it 'must return false' do
        expect(data_url.valid?).to eq(false)
      end
    end

    context 'when params' do
      let(:params) { { source_name: 'abcd', source_url: 'http://www.example.com/f.json', data_type: 'json' } }

      it 'must return true' do
        expect(data_url.valid?).to eq(true)
      end

      it 'must increase count by 1' do
        pandemic.data_urls.create!(params)

        expect(DataUrl.count).to eq(1)
      end
    end

    context 'when duplicate source_url' do
      let(:params) { { source_name: 'abcd', source_url: 'http://www.example.com/f.json', data_type: 'json' } }

      it 'must be valid' do
        pandemic.data_urls.create!(params)

        expect(data_url.valid?).to be(true)
      end
    end

    context 'when data_type is invalid' do
      let(:params) { { source_name: 'abcd', source_url: 'http://www.example.com/f.json', data_type: 'foo' } }

      it 'must not be valid' do
        expect(data_url.valid?).to be(false)
      end
    end
  end
end
