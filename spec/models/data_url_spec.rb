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
      let(:params) { { source_name: 'foo', source_url: 'http://www.example.com/foo_1.json', data_type: 'json', description: 'DataUrl Description' } }

      it 'must return true' do
        expect(data_url.valid?).to eq(true)
      end

      it 'must increase count by 1' do
        expect { DataUrl.create!(params) }.to change(DataUrl, :count).by(1)
      end
    end
  end
end
