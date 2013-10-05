require 'spec_helper'

describe "onions/edit" do
  before(:each) do
    @onion = assign(:onion, stub_model(Onion,
      :title => "MyString",
      :name => "MyString",
      :url => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit onion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", onion_path(@onion), "post" do
      assert_select "input#onion_title[name=?]", "onion[title]"
      assert_select "input#onion_name[name=?]", "onion[name]"
      assert_select "input#onion_url[name=?]", "onion[url]"
      assert_select "input#onion_description[name=?]", "onion[description]"
    end
  end
end
