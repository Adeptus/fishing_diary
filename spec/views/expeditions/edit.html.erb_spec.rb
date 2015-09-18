require 'rails_helper'

RSpec.describe "expeditions/edit", type: :view do
  before(:each) do
    @expedition = assign(:expedition, Expedition.create!(
      :place_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders the edit expedition form" do
    render

    assert_select "form[action=?][method=?]", expedition_path(@expedition), "post" do

      assert_select "input#expedition_place_id[name=?]", "expedition[place_id]"

      assert_select "textarea#expedition_notes[name=?]", "expedition[notes]"
    end
  end
end
