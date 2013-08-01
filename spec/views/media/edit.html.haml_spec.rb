require 'spec_helper'

describe "media/edit" do
  before(:each) do
    @medium = assign(:medium, stub_model(Medium,
      :name => "MyString",
      :description => "MyText",
      :address => "MyString"
    ))
  end

  it "renders the edit medium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", medium_path(@medium), "post" do
      assert_select "input#medium_name[name=?]", "medium[name]"
      assert_select "textarea#medium_description[name=?]", "medium[description]"
      assert_select "input#medium_address[name=?]", "medium[address]"
    end
  end
end
