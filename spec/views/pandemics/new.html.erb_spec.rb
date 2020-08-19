require 'rails_helper'

RSpec.describe "pandemics/new", type: :view do
  before(:each) do
    assign(:pandemic, Pandemic.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new pandemic form" do
    render

    assert_select "form[action=?][method=?]", pandemics_path, "post" do

      assert_select "input[name=?]", "pandemic[name]"

      assert_select "textarea[name=?]", "pandemic[description]"
    end
  end
end
