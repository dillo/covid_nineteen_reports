require 'rails_helper'

RSpec.describe 'data_urls/new', type: :view do
  before(:each) do
    @pandemic = Pandemic.create!(name: 'Pandemic', description: 'Pandemic Description')
    assign(:data_url, DataUrl.new(
                        source_name: 'MyString',
                        source_url: 'https://www.example.com/foo.json',
                        data_type: 'json',
                        pandemic: @pandemic
                      ))
  end

  it 'renders new data_url form' do
    render

    assert_select 'form[action=?][method=?]', pandemic_data_urls_path(@pandemic), 'post' do
      assert_select 'input[name=?]', 'data_url[source_name]'

      assert_select 'input[name=?]', 'data_url[source_url]'

      assert_select 'input[name=?]', 'data_url[data_type]'

      assert_select 'input[name=?]', 'data_url[pandemic_id]'
    end
  end
end
