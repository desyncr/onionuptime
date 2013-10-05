require 'spec_helper'

describe "statuses/edit" do
  before(:each) do
    @status = assign(:status, stub_model(Status,
      :onion => 1,
      :status => 1,
      :response => 1,
      :delivery => 1
    ))
  end

  it "renders the edit status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", status_path(@status), "post" do
      assert_select "input#status_onion[name=?]", "status[onion]"
      assert_select "input#status_status[name=?]", "status[status]"
      assert_select "input#status_response[name=?]", "status[response]"
      assert_select "input#status_delivery[name=?]", "status[delivery]"
    end
  end
end
