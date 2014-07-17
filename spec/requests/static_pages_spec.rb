require 'spec_helper'

describe "Static pages" do
  describe "Title Test" do
    it 'should have the right title' do
      visit '/static_pages/home'
      expect(page).to have_title("xus | SampleApp")
    end
  end

end
