require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/users").should route_to("users#index")
    end

    it "routes to #new" do
      get("/users/new").should route_to("users#new")
    end

    it "routes to #create" do
      post("/users").should route_to("users#create")
    end
    
    it "routes to #show" do
      user = FactoryGirl.create :user
      get("users/#{user.to_param}").should route_to(:controller => 'users', :action => 'show', :id => user.to_param)
    end
  end
end
