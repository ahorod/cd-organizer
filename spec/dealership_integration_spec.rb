
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('car dealership path', {:type => :feature}) do
  before() do
    Dealership.clear()
  end
  it('processes the user entry and saves it') do
    visit('/dealerships/new')
    fill_in('name', :with => 'Bob')
    click_button('Add Dealership')
    expect(page).to have_content('Success!')
  end
  it('processes the user entry and saves it') do
    visit('/dealerships/new')
    fill_in('name', :with => 'Rose')
    click_button('Add Dealership')
    click_link('See dealership List')
    expect(page).to have_content('Dealerships Rose Return to Main Page')
  end
  it('processes the user entry and saves it') do
    visit('/dealerships/new')
    fill_in('name', :with => 'Rose')
    click_button('Add Dealership')
    visit('/dealerships/1/vehicles/new')
    fill_in('make', :with => 'Toyota')
    fill_in('model', :with => 'Rav 4')
    fill_in('year', :with => '2003')
    click_button('Add Vehicle')
    expect(page).to have_content('Success!')
  end
end
