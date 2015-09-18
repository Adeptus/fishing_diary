require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :place_type => "Place Type",
        :name => "Name",
        :notes => "MyText",
        :address => "MyText"
      ),
      Place.create!(
        :place_type => "Place Type",
        :name => "Name",
        :notes => "MyText",
        :address => "MyText"
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => "Place Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
