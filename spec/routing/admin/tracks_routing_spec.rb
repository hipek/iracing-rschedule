require "rails_helper"

RSpec.describe Admin::TracksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/tracks").to route_to("admin/tracks#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/tracks/new").to route_to("admin/tracks#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/tracks/1").to route_to("admin/tracks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/tracks/1/edit").to route_to("admin/tracks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/tracks").to route_to("admin/tracks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/tracks/1").to route_to("admin/tracks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/tracks/1").to route_to("admin/tracks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/tracks/1").to route_to("admin/tracks#destroy", :id => "1")
    end

  end
end
