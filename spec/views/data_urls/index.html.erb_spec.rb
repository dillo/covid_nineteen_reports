require 'rails_helper'

RSpec.describe 'data_urls/index', type: :view do
  before(:each) do

    assign(:data_urls, [
      DataUrl.create!(
        source_name: 'One',
        source_url: 'https://www.example.com/123.rss',
        data_type: 'rss'
      ),
      DataUrl.create!(
        source_name: 'Two',
        source_url: 'https://www.example.com/345.json',
        data_type: 'json'
      )
    ])
  end

  it 'renders a list of data_urls' do
    render
    expect(rendered).to match(/One/)
    expect(rendered).to match(/Two/)
    expect(rendered).to match(/rss/)
    expect(rendered).to match(/json/)
    expect(rendered).to match(/123/)
    expect(rendered).to match(/345/)
  end
end
