
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('artist path', {:type => :feature}) do
  before() do
    Artist.clear()
  end
  it('processes the user entry and saves it') do
    visit('/artists/new')
    fill_in('name', :with => 'Bob')
    click_button('Add Artist')
    expect(page).to have_content('Success!')
  end
  it('processes the user entry and saves it') do
    visit('/artists/new')
    fill_in('name', :with => 'Rose')
    click_button('Add Artist')
    click_link("See List of Artists")
    expect(page).to have_content('Artists Rose Return to Main Page')
  end
  it('processes the user entry and saves it') do
    visit('/artists/new')
    fill_in('name', :with => 'Rose')
    click_button('Add Artist')
    visit('/artists/1/cds/new')
    fill_in('album', :with => 'bbq')
    click_button('Add Album')
    expect(page).to have_content('Success!')
  end
end
