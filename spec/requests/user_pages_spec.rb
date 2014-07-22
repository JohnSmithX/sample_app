require 'spec_helper'

describe "UserPages" do

  subject { page }
  # describe "Signup Page" do
  #   before { visit signup_path }
  #   it { should have_content('Sign up') }
  #   it { should have_title('Sign up') }
  # end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "注册" }
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end
    describe "with valid information" do
      before do
        fill_in "用户名", with: "Example User"
        fill_in "邮箱", with: "user@example.com"
        fill_in "密码", with: "foobar"
        fill_in "确认密码", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end