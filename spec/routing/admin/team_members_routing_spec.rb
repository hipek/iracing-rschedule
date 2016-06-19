require "rails_helper"

RSpec.describe Admin::TeamMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/teams/1/members").to route_to("admin/team_members#index", team_id: '1')
    end

    it "routes to #new" do
      expect(:get => "/admin/teams/1/members/new").to route_to("admin/team_members#new", team_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/admin/teams/1/members/1").to route_to("admin/team_members#show", :id => "1", team_id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/admin/teams/1/members/1/edit").to route_to("admin/team_members#edit", :id => "1", team_id: '1')
    end

    it "routes to #create" do
      expect(:post => "/admin/teams/1/members").to route_to("admin/team_members#create", team_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/teams/1/members/1").to route_to("admin/team_members#update", :id => "1", team_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/teams/1/members/1").to route_to("admin/team_members#update", :id => "1", team_id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/teams/1/members/1").to route_to("admin/team_members#destroy", :id => "1", team_id: '1')
    end

  end
end
