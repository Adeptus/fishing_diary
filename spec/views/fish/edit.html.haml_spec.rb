require 'rails_helper'

RSpec.describe "fish/edit", type: :view do
  before(:each) do
    @fish = assign(:fish, Fish.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit fish form" do
    render

    assert_select "form[action=?][method=?]", fish_path(@fish), "post" do

      assert_select "input#fish_name[name=?]", "fish[name]"

      assert_select "textarea#fish_description[name=?]", "fish[description]"
    end
  end
end
