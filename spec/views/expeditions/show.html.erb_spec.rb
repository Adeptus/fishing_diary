require 'rails_helper'

RSpec.describe "expeditions/show", type: :view do
  before(:each) do
    @expedition = assign(:expedition, Expedition.create!(
      :place_id => 1,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
