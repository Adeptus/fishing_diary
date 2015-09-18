require 'rails_helper'

RSpec.describe "expeditions/new", type: :view do
  before(:each) do
    assign(:expedition, Expedition.new(
      :place_id => 1,
      :notes => "MyText",
      :pressure => "MyString",
      :showers => "MyString",
      :overcast => "MyString",
      :temperature => 1
    ))
  end

  it "renders new expedition form" do
    render

    assert_select "form[action=?][method=?]", expeditions_path, "post" do

      assert_select "input#expedition_place_id[name=?]", "expedition[place_id]"

      assert_select "textarea#expedition_notes[name=?]", "expedition[notes]"

      assert_select "input#expedition_pressure[name=?]", "expedition[pressure]"

      assert_select "input#expedition_showers[name=?]", "expedition[showers]"

      assert_select "input#expedition_overcast[name=?]", "expedition[overcast]"

      assert_select "input#expedition_temperature[name=?]", "expedition[temperature]"
    end
  end
end
