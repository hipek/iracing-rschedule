require 'rails_helper'

RSpec.describe "Admin::TeamMembers", type: :request do
  describe "GET /admin/teams/members" do
    it "works! (now write some real specs)" do
      get admin_team_members_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
