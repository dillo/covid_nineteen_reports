require 'rails_helper'

RSpec.describe 'data_urls/index', type: :view do
  before(:each) do
    @pandemic = Pandemic.create!(name: 'Pandemic', description: 'Pandemic Description')
    @data_urls = assign(:pandemic_data_urls, [
                    DataUrl.create!(
                      source_name: 'Source Name',
                      source_url: 'https://www.example.com/foo.rss',
                      data_type: 'rss',
                      pandemic: @pandemic
                    ),
                    DataUrl.create!(
                      source_name: 'Source Name',
                      source_url: 'https://www.example.com/foo.json',
                      data_type: 'json',
                      pandemic: @pandemic
                    )
                  ])
  end

  it 'renders a list of data_urls' do
    render
    expect(rendered).to match(/Source Name/)
    expect(rendered).to match(/json/)
    expect(rendered).to match(/rss/)
  end
end
