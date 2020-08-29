require 'rails_helper'

RSpec.describe 'pandemics/index', type: :view do
  before(:each) do
    assign(:pandemics, [
             Pandemic.create!(
               name: 'One',
               description: 'MyText'
             ),
             Pandemic.create!(
               name: 'Two',
               description: 'Description'
             )
           ])
  end

  it 'renders a list of pandemics' do
    render
    expect(rendered).to match(/One/)
    expect(rendered).to match(/Two/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Added/)
  end
end
