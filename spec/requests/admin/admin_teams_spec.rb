require 'rails_helper'

RSpec.describe "Admin::Teams", type: :request do
  describe "GET /admin_teams" do
    it "works! (now write some real specs)" do
      get admin_teams_path
      expect(response).to have_http_status(200)
    end
  end
end
