require 'rails_helper'

RSpec.describe "expeditions/show", type: :view do
  before(:each) do
    @expedition = assign(:expedition, Expedition.create!(
      :place_id => 1,
      :notes => "MyText",
      :pressure => "Pressure",
      :showers => "Showers",
      :overcast => "Overcast",
      :temperature => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Pressure/)
    expect(rendered).to match(/Showers/)
    expect(rendered).to match(/Overcast/)
    expect(rendered).to match(/2/)
  end
end
