require 'rails_helper'

RSpec.describe 'data_urls/show', type: :view do
  before(:each) do
    @pandemic = Pandemic.create!(name: 'Pandemic', description: 'Pandemic Description')
    @data_url = assign(:pandemic_data_url, @pandemic.data_urls.create!(
                                    source_name: 'Source Name',
                                    source_url: 'https://www.example.com/foo.json',
                                    data_type: 'json'
                                  ))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Source Name/)
    expect(rendered).to match(/json/)
  end
end
