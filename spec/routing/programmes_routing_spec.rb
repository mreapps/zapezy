require "spec_helper"

describe ProgrammesController do
  describe "routing" do

    it "routes to #index" do
      get("/programmes").should route_to("programmes#index")
    end

    it "routes to #new" do
      get("/programmes/new").should route_to("programmes#new")
    end

    it "routes to #show" do
      get("/programmes/1").should route_to("programmes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/programmes/1/edit").should route_to("programmes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/programmes").should route_to("programmes#create")
    end

    it "routes to #update" do
      put("/programmes/1").should route_to("programmes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/programmes/1").should route_to("programmes#destroy", :id => "1")
    end

  end
end
