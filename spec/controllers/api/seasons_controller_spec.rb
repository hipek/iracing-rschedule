require 'rails_helper'

RSpec.describe Api::SeasonsController, type: :controller do
  let(:params) do
    { format: :json }
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: params.merge(id: 1)
      expect(response).to have_http_status(:success)
    end
  end
end
