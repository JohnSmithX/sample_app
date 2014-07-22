require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "signin page" do

    before { visit signin_path }

    it { should have_content('登  陆') }
    it { should have_title('Sign in') }

  end

  describe "signin" do
    before { visit signin_path }
    describe "with invalid information" do
      before { click_button "登陆" }
      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-danger', text: 'Invalid') }
      describe "after visiting another page" do
        before { click_link "主页" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "邮箱", with: user.email.upcase
        fill_in "密码", with: user.password
        click_button "登陆"
      end
      it { should have_title(user.name) }
      # it { should have_link('Profile', href: user_path(user)) }
      # it { should have_link('Sign out', href: signout_path) }
      # it { should_not have_link('Sign in', href: signin_path) }
      describe "followed by signout" do
        before { click_link "登出" }
        it { should have_link('登陆') }
      end
    end
  end






end
