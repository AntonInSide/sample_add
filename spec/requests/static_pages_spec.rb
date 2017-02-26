require 'spec_helper'

      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
describe "StaticPages" do
	let(:base_title) { "Task manager" }
  subject {page}

  shared_examples_for "all static pages" do
    it {should have_selector('h1', text: heading)}
    it {should have_title(full_title(page_title))}
  end

  describe "Home page" do
    before {visit root_path}
    let(:heading) {'Task manager'}
    let(:page_title) {''}
    it_should_behave_like "all static pages"
    it {should_not have_title('| Home')}
  end

  describe "Help page" do
    before {visit help_path}
    let(:heading) {'Help'}
    let(:page_title) {''}
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before {visit about_path}
    let(:heading) {'About Us'}
    let(:page_title) {''}
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before {visit contact_path}
    let(:heading) {'Contact'}
    let(:page_title) {''}
    it_should_behave_like "all static pages"
  end
  it "should have the right link on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title(''))
    click_link "Help"
    expect(page).to have_title(full_title(''))
    click_link "Contact"
    expect(page).to have_title(full_title(''))
    click_link "Home"
    click_link "Sign up Now!"
    expect(page).to have_title(full_title(''))
    click_link "task manager"
    expect(page).to have_title(full_title(''))
  end
end
