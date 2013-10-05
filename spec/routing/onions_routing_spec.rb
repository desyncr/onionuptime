require "spec_helper"

describe OnionsController do
  describe "routing" do

    it "routes to #index" do
      get("/onions").should route_to("onions#index")
    end

    it "routes to #new" do
      get("/onions/new").should route_to("onions#new")
    end

    it "routes to #show" do
      get("/onions/1").should route_to("onions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/onions/1/edit").should route_to("onions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/onions").should route_to("onions#create")
    end

    it "routes to #update" do
      put("/onions/1").should route_to("onions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/onions/1").should route_to("onions#destroy", :id => "1")
    end

  end
end
