require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#menu_status' do
    let(:controller_name) { 'foo' }

    context 'when controller name matches' do
      it 'must return `active`' do
        expect(menu_status('foo')).to eq('active')
      end
    end

    context 'when controller name does not match' do
      it 'must return nil' do
        expect(menu_status('bar')).to eq(nil)
      end
    end
  end
end
