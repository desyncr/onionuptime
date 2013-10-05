require 'spec_helper'

describe "onions/show" do
  before(:each) do
    @onion = assign(:onion, stub_model(Onion,
      :title => "Title",
      :name => "Name",
      :url => "Url",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/Description/)
  end
end
