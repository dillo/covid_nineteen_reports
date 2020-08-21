require 'rails_helper'

RSpec.describe 'pandemics/index', type: :view do
  before(:each) do
    assign(:pandemics, [
             Pandemic.create!(
               name: 'Name',
               description: 'MyText'
             ),
             Pandemic.create!(
               name: 'Name',
               description: 'MyText'
             )
           ])
  end

  it 'renders a list of pandemics' do
    render
    assert_select 'div>h5', text: 'Name'.to_s, count: 2
    assert_select 'div>p', text: 'MyText'.to_s, count: 2
  end
end
