require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :place_type => "MyString",
      :name => "MyString",
      :notes => "MyText",
      :address => "MyText"
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input#place_place_type[name=?]", "place[place_type]"

      assert_select "input#place_name[name=?]", "place[name]"

      assert_select "textarea#place_notes[name=?]", "place[notes]"

      assert_select "textarea#place_address[name=?]", "place[address]"
    end
  end
end
