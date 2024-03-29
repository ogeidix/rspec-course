require 'spec_helper'

describe User do

  it "require a unique email to be valid" do
    user1 = FactoryGirl.create :user, :email => 'one@rr.com'
    user2 = FactoryGirl.build  :user, :email => 'one@rr.com'
    user2.should_not be_valid
    user2.should have(1).error_on(:email)
  end

  it "require a unique nickname to be valid" do
    user1 = FactoryGirl.create :user, :nickname => 'prova'
    user2 = FactoryGirl.build  :user, :nickname => 'prova'
    user2.should_not be_valid
    user2.should have(1).error_on(:nickname)
  end

  context "when created" do
    before(:each){
      @user = FactoryGirl.create :user, :name => 'diego', :surname => 'giorgini'
    }

    it "capitalize name" do
      @user.name.should == 'Diego'
    end

    it "capitalize surname" do
      @user.surname.should == 'Giorgini'
    end
  end

  describe "#obfuscated_email" do
    before(:each){
      @user = FactoryGirl.build(:user, :email =>'diego@giorgini.com')
    }

    it "prints the first three letters of the email user" do
      @user.obfuscated_email.should match /^die\.\.\.\@/
    end
    
    it "prints the last three letter of the email domain and the tld" do
      @user.obfuscated_email.should match /\@\.\.\.ini\.com$/
    end
  end
  
  context "after created" do
    it "retrieve last tweet if nickname is present" do
      user = FactoryGirl.build :user, :nickname => 'ogeidix'
      user.should_receive(:retrieve_last_tweet)
      user.save
    end
    
    it " doen't retrieve last tweet if nickname is NOT present" do
      user = FactoryGirl.build :user, :nickname => nil
      user.should_not_receive(:retrieve_last_tweet)
      user.save
    end
  end  
end
