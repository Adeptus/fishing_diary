require 'rails_helper'

RSpec.describe "expeditions/index", type: :view do
  before(:each) do
    assign(:expeditions, [
      Expedition.create!(
        :place_id => 1,
        :notes => "MyText"
      ),
      Expedition.create!(
        :place_id => 1,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of expeditions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
