require 'rails_helper'

RSpec.describe 'pandemics/edit', type: :view do
  before(:each) do
    @pandemic = assign(:pandemic, Pandemic.create!(
                                    name: 'MyString',
                                    description: 'MyText'
                                  ))
  end

  it 'renders the edit pandemic form' do
    render

    assert_select 'form[action=?][method=?]', pandemic_path(@pandemic), 'post' do
      assert_select 'input[name=?]', 'pandemic[name]'
      assert_select 'textarea[name=?]', 'pandemic[description]'
      assert_select 'input[name=?]', 'pandemic[data_url_ids][]'
    end
  end
end
