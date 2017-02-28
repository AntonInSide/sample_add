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
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before {valids_inf}

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end
