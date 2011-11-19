require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    assign(:user,FactoryGirl.build(:user))
  end

  it "renders new user form" do
    render

    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_surname", :name => "user[surname]"
      assert_select "input#user_nickname", :name => "user[nickname]"      
      assert_select "input#user_email", :name => "user[email]"
    end
  end
end
