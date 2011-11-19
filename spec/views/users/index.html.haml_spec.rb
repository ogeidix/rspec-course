require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    @user1 = FactoryGirl.create :user
    @user2 = FactoryGirl.create :user
    assign(:users, [@user1,@user2])
  end

  it "renders a list of users" do
    render
    assert_select "#users" do 
      [@user1,@user2].each do |user|
        assert_select "tr#user-#{user.id}" do
          assert_select "td.name",    :text => user.name + " " + user.surname
          assert_select "td.email",   :text => user.obfuscated_email
        end
      end
    end
  end
end
