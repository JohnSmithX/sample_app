require 'spec_helper'

describe "UserPages" do

  subject { page }
  # describe "Signup Page" do
  #   before { visit signup_path }
  #   it { should have_content('Sign up') }
  #   it { should have_title('Sign up') }
  # end
  describe "index" do
    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
      visit users_path
    end
    it { should have_title('All users') }
    it { should have_content('所有用户') }
    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }
      it { should have_selector('div.pagination') }
      it "should list each user" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end
    end

    describe "delete links" do
      it { should_not have_link('删除') }
      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end
        it { should have_link('删除', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('删除', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('删除', href: user_path(admin)) }
      end
    end

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }
    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }
    end
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

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com')}

        it { should have_link('登出') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }

      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("设  置") }
      it { should have_title("Edit user") }
      it { should have_link('修改', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "保存" }
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "用户名", with: new_name
        fill_in "邮箱", with: new_email
        fill_in "密码", with: user.password
        fill_in "确认密码", with: user.password
        click_button "保存"
      end
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('登出', href: signout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end
