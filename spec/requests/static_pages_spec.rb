require 'spec_helper'
describe "Static pages" do


  subject {page}
  describe "Contact page" do
    before {visit contact_path}

    it {should have_content('contact')}
    it {should have_title('contact | SampleApp')}
    # it "should have the content 'Contact'" do
    #   expect(page).to have_content('contact')
    # end
    # it "should have the title 'Contact'" do
    #   # visit contact_path
    #   expect(page).to have_title("contact | SampleApp")
    # end
  end

  describe "Home page" do
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end
end