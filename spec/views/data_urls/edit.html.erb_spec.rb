require 'rails_helper'

RSpec.describe 'data_urls/edit', type: :view do
  before(:each) do
    @data_url = assign(:data_url, DataUrl.create!(
                                    source_name: 'MyString',
                                    source_url: 'https://www.example.com/foo.json',
                                    data_type: 'json'
                                  ))
  end

  it 'renders the edit data_url form' do
    render

    assert_select 'form[action=?][method=?]', data_url_path(@data_url), 'post' do
      assert_select 'input[name=?]', 'data_url[source_name]'

      assert_select 'input[name=?]', 'data_url[source_url]'

      assert_select 'input[name=?]', 'data_url[data_type]'
    end
  end
end
