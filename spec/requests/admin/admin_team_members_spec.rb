require 'rails_helper'

RSpec.describe "Admin::TeamMembers", type: :request do
  describe "GET /admin_team_members" do
    it "works! (now write some real specs)" do
      get admin_team_members_index_path
      expect(response).to have_http_status(200)
    end
  end
end
