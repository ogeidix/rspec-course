require 'spec_helper'

describe User do

  it "require a unique email to be valid" do
    user1 = User.create(:email => 'one@rr.com')
    user2 = User.create(:email => 'one@rr.com')
    user2.should_not be_valid
    user2.should have(1).error_on(:email)
  end

end
