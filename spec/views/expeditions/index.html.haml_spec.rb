require 'rails_helper'

RSpec.describe "expeditions/index", type: :view do
  before(:each) do
    assign(:expeditions, [
      Expedition.create!(
        :place_id => 1,
        :notes => "MyText",
        :pressure => "Pressure",
        :showers => "Showers",
        :overcast => "Overcast",
        :temperature => 2
      ),
      Expedition.create!(
        :place_id => 1,
        :notes => "MyText",
        :pressure => "Pressure",
        :showers => "Showers",
        :overcast => "Overcast",
        :temperature => 2
      )
    ])
  end

  it "renders a list of expeditions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Pressure".to_s, :count => 2
    assert_select "tr>td", :text => "Showers".to_s, :count => 2
    assert_select "tr>td", :text => "Overcast".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
