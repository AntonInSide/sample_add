require 'spec_helper'

      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
describe "StaticPages" do
	let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
     it "should have the rigth title" do
  	  visit '/static_pages/home'
  	  expect(page).to have_title("#{base_title}")
  	end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
  describe "Help page" do
    it "should have the content 'Help'" do
    	visit '/static_pages/help'
    	expect(page).to have_content('help')
    end
    it "should have the rigth title" do
  	  visit '/static_pages/help'
  	  expect(page).to have_title("#{base_title} | Help")
  	end
  end
  describe "About page" do
  	it "should have the content 'About Us'" do
  		visit '/static_pages/about'
  		expect(page). to have_content('About Us')
  	end
  	it "should have the rigth title" do
  	  visit '/static_pages/about'
  	  expect(page).to have_title("#{base_title} | About")
  	end
  end
  describe "Contact page" do
  	it "should have the rigth title" do
  	 visit '/static_pages/contact'
  	 expect(page).to have_title("#{base_title} | Contact")
  	end
  end
end
