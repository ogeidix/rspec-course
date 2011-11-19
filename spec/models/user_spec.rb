require 'spec_helper'

describe User do

  it "require a unique email to be valid" do
    user1 = User.create(:email => 'one@rr.com')
    user2 = User.create(:email => 'one@rr.com')
    user2.should_not be_valid
    user2.should have(1).error_on(:email)
  end
  
  it "capitalize name when created" do
    user = User.create(:name => 'diego', :surname => 'giorgini', :email => 'diego@giorgini.com')
    user.name.should == 'Diego'
  end

end
