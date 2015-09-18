require "rails_helper"

RSpec.describe ExpeditionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/expeditions").to route_to("expeditions#index")
    end

    it "routes to #new" do
      expect(:get => "/expeditions/new").to route_to("expeditions#new")
    end

    it "routes to #show" do
      expect(:get => "/expeditions/1").to route_to("expeditions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/expeditions/1/edit").to route_to("expeditions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/expeditions").to route_to("expeditions#create")
    end

    it "routes to #update" do
      expect(:put => "/expeditions/1").to route_to("expeditions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/expeditions/1").to route_to("expeditions#destroy", :id => "1")
    end

  end
end
