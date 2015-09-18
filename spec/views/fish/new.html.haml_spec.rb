require 'rails_helper'

RSpec.describe "fish/new", type: :view do
  before(:each) do
    assign(:fish, Fish.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new fish form" do
    render

    assert_select "form[action=?][method=?]", fish_index_path, "post" do

      assert_select "input#fish_name[name=?]", "fish[name]"

      assert_select "textarea#fish_description[name=?]", "fish[description]"
    end
  end
end
