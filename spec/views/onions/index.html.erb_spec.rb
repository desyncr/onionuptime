require 'spec_helper'

describe "onions/index" do
  before(:each) do
    assign(:onions, [
      stub_model(Onion,
        :title => "Title",
        :name => "Name",
        :url => "Url",
        :description => "Description"
      ),
      stub_model(Onion,
        :title => "Title",
        :name => "Name",
        :url => "Url",
        :description => "Description"
      )
    ])
  end

  it "renders a list of onions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
