require 'spec_helper.rb'

feature "Hitting the home page", js: true do

  before do
    Workbook.create!(name: 'Calculus I')
    Workbook.create!(name: 'Algebra III', description: "It's a silly class.")
  end

  scenario "visiting the home page" do
    visit '/'
    expect(page).to have_content("Home")
    expect(page).to have_content('Algebra III')

    fill_in "queryWorkbooks", with: 'lcUl'
    expect(page).to_not have_content('Algebra III')
    expect(page).to have_content('Calculus I')
  end

  scenario "browsing to a workbook" do
    visit '/'
    click_link 'Algebra III'
    expect(page).to have_content('Description')
  end

end