require 'spec_helper'

      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
describe "User Pages" do
	subject {page}

	describe "SignUp page" do
		before {visit signup_path}
		it {should have_content('Sign Up')}
		it {should have_title(full_title(''))}
	end
end
