require 'spec_helper.rb'

feature "Hitting the home page", js: true do
  before do
    Workbook.create!(name: 'Calculus I')
    Workbook.create!(name: 'Algebra III')
  end
  scenario "visiting the home page" do
    visit '/'
    expect(page).to have_content("Home")
    expect(page).to have_content('Algebra III')

    fill_in "queryWorkbooks", with: 'lcUl'
    expect(page).to_not have_content('Algebra III')
    expect(page).to have_content('Calculus I')
  end
end