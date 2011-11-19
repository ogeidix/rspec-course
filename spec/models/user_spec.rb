require 'spec_helper'

describe User do

  it "require a unique email to be valid" do
    user1 = User.create(:email => 'one@rr.com')
    user2 = User.create(:email => 'one@rr.com')
    user2.should_not be_valid
    user2.should have(1).error_on(:email)
  end

  context "when created" do
    before(:each){
      @user = User.create(:name => 'diego', :surname => 'giorgini', :email => 'diego@giorgini.com')
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
      @user = User.new(:name => 'one', :surname => 'two', :email => 'diego@giorgini.com')
    }

    it "prints the first three letters of the email user" do
      @user.obfuscated_email.should match /^die\.\.\.\@/
    end
    
    it "prints the last three letter of the email domain and the tld" do
      @user.obfuscated_email.should match /\@\.\.\.ini\.com$/
    end
  end
end
