require 'rails_helper'

RSpec.describe "fish/index", type: :view do
  before(:each) do
    assign(:fish, [
      Fish.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Fish.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of fish" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
