require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user){ FactoryGirl.create(:user) }
  let(:user2){ FactoryGirl.create(:user, username: "Jane", password: "abc", password_confirmation: "abc")}
  let(:card){ FactoryGirl.create(:card) }

  let(:valid_session) { {user_id: 1} }


  describe "GET index" do

    it "redirects user to root when not logged in" do
      get :index, {}, nil
      expect(response).to redirect_to root_path
    end

    it "redirects logged in user to their profile page" do
      get :index, {:id => user.to_param}, valid_session
      expect(response).to redirect_to user_path(user)
    end

  end

  describe "GET show" do

    it "shows a logged in user thier profile" do
      get :show, {:id => user.to_param}, valid_session
      expect(response).to render_template(:show)
    end

    it "assigns all user's cards to @cards" do
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:cards)).to eq([card])
    end

    it "redirects logged in user to thier own profile if they try to view someone else's" do
      user
      user2
      get :show, {:id => user2.to_param}, valid_session
      expect(response).to redirect_to user_path(user)
    end

    it "redirects user to root when not logged in" do
      get :show, {:id => user.to_param}, nil
      expect(response).to redirect_to root_path
    end

  end

  describe "GET edit" do

    it "renders the edit view for a logged in user" do
      get :edit, {:id => user.to_param}, valid_session
      expect(response).to render_template(:edit)
    end

    it "it redirects a logged in user to thier edit page if they try to access another user's page" do
      user
      user2
      get :edit, {:id => user2.to_param}, valid_session
      expect(response).to redirect_to edit_user_path(user)
    end

    it "redirects user to root when not logged in" do
      get :edit, {:id => user.to_param}, nil
      expect(response).to redirect_to root_path
    end

  end

  describe "POST create" do

    describe  "with vaild params" do
      
      it "creates a new user if NO user is logged in" do
        expect {
          post :create, {user: attributes_for(:user)}, nil
          }.to change(User, :count).by(1)
      end

      # it "creates a new user if a user is logged in" do
      #   user
      #   expect {
      #     post :create, {user: attributes_for(:user)}, valid_session
      #     }.to change(User, :count).by(1)
      # end

    end

  end


end