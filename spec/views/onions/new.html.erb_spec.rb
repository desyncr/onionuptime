require 'spec_helper'

describe "onions/new" do
  before(:each) do
    assign(:onion, stub_model(Onion,
      :title => "MyString",
      :name => "MyString",
      :url => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new onion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", onions_path, "post" do
      assert_select "input#onion_title[name=?]", "onion[title]"
      assert_select "input#onion_name[name=?]", "onion[name]"
      assert_select "input#onion_url[name=?]", "onion[url]"
      assert_select "input#onion_description[name=?]", "onion[description]"
    end
  end
end
