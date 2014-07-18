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
end