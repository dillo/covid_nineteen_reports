require 'rails_helper'

RSpec.describe "pandemics/show", type: :view do
  before(:each) do
    @pandemic = assign(:pandemic, Pandemic.create!(
      name: "Name",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
