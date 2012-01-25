require "spec_helper"

describe VolatilitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/volatilities").should route_to("volatilities#index")
    end

    it "routes to #new" do
      get("/volatilities/new").should route_to("volatilities#new")
    end

    it "routes to #show" do
      get("/volatilities/1").should route_to("volatilities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/volatilities/1/edit").should route_to("volatilities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/volatilities").should route_to("volatilities#create")
    end

    it "routes to #update" do
      put("/volatilities/1").should route_to("volatilities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/volatilities/1").should route_to("volatilities#destroy", :id => "1")
    end

  end
end
