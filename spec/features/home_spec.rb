require 'spec_helper.rb'

feature "Hitting the home page", js: true do
  scenario "visiting the home page" do
    visit '/'
    expect(page).to have_content("Home")

    click_on "foo"
    expect(page).to have_content("Foo")
  end
end