require 'rails_helper'

RSpec.describe Admin::TracksController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tracks as @tracks" do
      track = Track.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tracks)).to eq([track])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_track as @admin_track" do
      track = Track.create! valid_attributes
      get :show, {:id => track.to_param}, valid_session
      expect(assigns(:track)).to eq(track)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_track as @admin_track" do
      get :new, {}, valid_session
      expect(assigns(:track)).to be_a_new(Track)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_track as @admin_track" do
      track = Track.create! valid_attributes
      get :edit, {:id => track.to_param}, valid_session
      expect(assigns(:track)).to eq(track)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Track" do
        expect {
          post :create, {:admin_track => valid_attributes}, valid_session
        }.to change(Track, :count).by(1)
      end

      it "assigns a newly created admin_track as @admin_track" do
        post :create, {:admin_track => valid_attributes}, valid_session
        expect(assigns(:track)).to be_a(Track)
        expect(assigns(:track)).to be_persisted
      end

      it "redirects to the created admin_track" do
        post :create, {:admin_track => valid_attributes}, valid_session
        expect(response).to redirect_to(Track.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_track as @admin_track" do
        post :create, {:admin_track => invalid_attributes}, valid_session
        expect(assigns(:track)).to be_a_new(Track)
      end

      it "re-renders the 'new' template" do
        post :create, {:admin_track => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :admin_track => new_attributes}, valid_session
        track.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_track as @admin_track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :admin_track => valid_attributes}, valid_session
        expect(assigns(:track)).to eq(track)
      end

      it "redirects to the admin_track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :admin_track => valid_attributes}, valid_session
        expect(response).to redirect_to(track)
      end
    end

    context "with invalid params" do
      it "assigns the admin_track as @admin_track" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :admin_track => invalid_attributes}, valid_session
        expect(assigns(:track)).to eq(track)
      end

      it "re-renders the 'edit' template" do
        track = Track.create! valid_attributes
        put :update, {:id => track.to_param, :admin_track => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_track" do
      track = Track.create! valid_attributes
      expect {
        delete :destroy, {:id => track.to_param}, valid_session
      }.to change(Track, :count).by(-1)
    end

    it "redirects to the tracks list" do
      track = Track.create! valid_attributes
      delete :destroy, {:id => track.to_param}, valid_session
      expect(response).to redirect_to(tracks_url)
    end
  end

end
