require 'spec_helper'

      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
describe "User Pages" do
	subject {page}

	describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
    end
	describe "signup page" do

    	before { visit signup_path }
    	let(:submit) { "Create my account" }

    	describe "with invalid information" do
      		it "should not create a user" do
        		expect { click_button submit }.not_to change(User, :count)
      		end
          	describe "after submision" do
    			before {click_button submit}
    			it {should have_title('Sign up')}
    			it {should have_content('error')}
    		end
    	end
    	describe "with valid information" do
      		before {valid_inf}
      		it "should create a user" do
        		expect { click_button submit }.to change(User, :count).by(1)
      		end
      		describe "after savin the user" do
      			before {click_button submit} 
      			let(:user) {User.find_by(email: 'user@example.com')}
      			it {should have_title(user.name)}
      			it {should have_selector('div.alert.alert-success', text: 'Welcome')}
      		end
    	end
    end

end
