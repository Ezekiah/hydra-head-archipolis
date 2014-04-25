require "spec_helper"

describe OrgunitsController do
  describe "routing" do

    it "routes to #index" do
      get("/orgunits").should route_to("orgunits#index")
    end

    it "routes to #new" do
      get("/orgunits/new").should route_to("orgunits#new")
    end

    it "routes to #show" do
      get("/orgunits/1").should route_to("orgunits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/orgunits/1/edit").should route_to("orgunits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/orgunits").should route_to("orgunits#create")
    end

    it "routes to #update" do
      put("/orgunits/1").should route_to("orgunits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/orgunits/1").should route_to("orgunits#destroy", :id => "1")
    end

  end
end
