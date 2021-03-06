require 'rails_helper'

RSpec.describe Admin::TeamMembersController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all team_members as @team_members" do
      team_member = TeamMember.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:team_members)).to eq([team_member])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_team_member as @admin_team_member" do
      team_member = TeamMember.create! valid_attributes
      get :show, {:id => team_member.to_param}, valid_session
      expect(assigns(:team_member)).to eq(team_member)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_team_member as @admin_team_member" do
      get :new, params: { team_id: 1 }, sesion: valid_session
      expect(assigns(:team_member)).to be_a_new(TeamMember)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_team_member as @admin_team_member" do
      team_member = TeamMember.create! valid_attributes
      get :edit, {:id => team_member.to_param}, valid_session
      expect(assigns(:team_member)).to eq(team_member)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TeamMember" do
        expect {
          post :create, {:team_member => valid_attributes}, valid_session
        }.to change(TeamMember, :count).by(1)
      end

      it "assigns a newly created admin_team_member as @admin_team_member" do
        post :create, {:team_member => valid_attributes}, valid_session
        expect(assigns(:team_member)).to be_a(TeamMember)
        expect(assigns(:team_member)).to be_persisted
      end

      it "redirects to the created admin_team_member" do
        post :create, {:team_member => valid_attributes}, valid_session
        expect(response).to redirect_to(TeamMember.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_team_member as @admin_team_member" do
        post :create, {:team_member => invalid_attributes}, valid_session
        expect(assigns(:team_member)).to be_a_new(TeamMember)
      end

      it "re-renders the 'new' template" do
        post :create, {:team_member => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_team_member" do
        team_member = TeamMember.create! valid_attributes
        put :update, {:id => team_member.to_param, :team_member => new_attributes}, valid_session
        team_member.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_team_member as @admin_team_member" do
        team_member = TeamMember.create! valid_attributes
        put :update, {:id => team_member.to_param, :team_member => valid_attributes}, valid_session
        expect(assigns(:team_member)).to eq(team_member)
      end

      it "redirects to the admin_team_member" do
        team_member = TeamMember.create! valid_attributes
        put :update, {:id => team_member.to_param, :team_member => valid_attributes}, valid_session
        expect(response).to redirect_to(team_member)
      end
    end

    context "with invalid params" do
      it "assigns the admin_team_member as @admin_team_member" do
        team_member = TeamMember.create! valid_attributes
        put :update, {:id => team_member.to_param, :team_member => invalid_attributes}, valid_session
        expect(assigns(:team_member)).to eq(team_member)
      end

      it "re-renders the 'edit' template" do
        team_member = TeamMember.create! valid_attributes
        put :update, {:id => team_member.to_param, :team_member => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_team_member" do
      team_member = TeamMember.create! valid_attributes
      expect {
        delete :destroy, {:id => team_member.to_param}, valid_session
      }.to change(TeamMember, :count).by(-1)
    end

    it "redirects to the team_members list" do
      team_member = TeamMember.create! valid_attributes
      delete :destroy, {:id => team_member.to_param}, valid_session
      expect(response).to redirect_to(team_members_url)
    end
  end

end
