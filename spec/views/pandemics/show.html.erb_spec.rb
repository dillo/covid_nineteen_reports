require 'rails_helper'

RSpec.describe 'pandemics/show', type: :view do
  before(:each) do
    @pandemic = assign(:pandemic, Pandemic.create!(
                                    name: 'Name',
                                    description: 'MyText'
                                  ))
    @pandemic.data_urls.create!({source_name: 'foo', source_url: 'http://www.example.com/foo_1.json',
      data_type: 'json', description: 'DataUrl Description'})
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/foo/)
    expect(rendered).to match(/json/)
    expect(rendered).to match(/DataUrl Description/)
  end
end
