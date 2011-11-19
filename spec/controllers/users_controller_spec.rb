require 'spec_helper'

describe UsersController do

  describe "#index" do
    it "assigns all users as @users" do
      user = FactoryGirl.create :user
      get :index
      assigns(:users).should eq([user])
    end
  end

  describe "#new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end
  
  describe "#create" do
    before(:each){
      @valid_attributes = {:email => 'diego@giorgini.com', :nickname => 'ogeidix'}
    }

    context "with valid params" do
      it "creates a new user" do
        expect {
          post :create, :user => @valid_attributes
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, :user => @valid_attributes
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the users list" do
        post :create, :user => @valid_attributes
        response.should redirect_to(users_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        assigns(:user).should be_a_new(User)
      end
      
      it "doesn't save a new user" do
        User.any_instance.stub(:save).and_return(false)        
        expect {
          post :create, :user => {}
        }.to change(User, :count).by(0)
      end

      it "re-renders the 'new' template" do
        User.any_instance.stub(:save).and_return(false)
        post :create, :course => {}
        response.should render_template("new")
      end
    end
  end
end