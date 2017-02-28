#include ApplicationHelper 

def full_title(page_title)
		base_title="Task manager"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		it {should have_error_message('Invalid')}
	end
end
def valid_inf
	fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "user@example.com"
    fill_in "Password",     with: "foobar"
    fill_in "Confirmation", with: "foobar"
end

def valids_inf
	fill_in "Name",             with: new_name
    fill_in "Email",            with: new_email
    fill_in "Password",         with: user.password
    fill_in "Confirm Password", with: user.password
    click_button "Save changes"
end