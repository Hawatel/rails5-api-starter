require "rails_helper"

RSpec.describe TodosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/todos").to route_to(:format=>"json", :controller=>"todos", :action=>"index")
    end

    it "routes to #new" do
      expect(:get => "/todos/new").to route_to(:format=>"json", :controller=>"todos", :action=>"show", :id=>"new")
    end

    it "routes to #show" do
      expect(:get => "/todos/1").to route_to(:format=>"json", :controller=>"todos", :action=>"show", :id=>"1")
    end

    it "routes to #create" do
      expect(:post => "/todos").to route_to(:format=>"json", :controller=>"todos", :action=>"create")
    end

    it "routes to #update" do
      expect(:put => "/todos/1").to route_to(:format=>"json", :controller=>"todos", :action=>"update", :id=>"1")
    end

    it "routes to #destroy" do
      expect(:delete => "/todos/1").to route_to(:format=>"json", :controller=>"todos", :action=>"destroy", :id=>"1")
    end

  end
end
