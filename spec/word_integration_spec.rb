require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the words and definitions path', {:type => :feature}) do
  it('goes to the words list page') do
    visit('/')
    click_link('See them werds')
    expect(page).to have_content('Words')
  end

  it('goes to add new word form') do
    visit('/')
    click_link('Add a new werd')
    expect(page).to have_content('Add a new werd')
  end

  it('adds new word to list of words') do
    visit('/')
    click_link('Add a new werd')
    fill_in('word', :with => 'Vegetarian')
    click_button('Add')
    expect(page).to have_content('Vegetarian')
  end

  it('goes to definitions page for word') do
    visit('/words')
    click_link('Vegetarian')
    expect(page).to have_content('Definitions for Vegetarian')
  end

  it('goes to definitions page for word') do
    visit('/words')
    click_link('Vegetarian')
    click_link('Add a new derfinetion')
    expect(page).to have_content('Add a new derfinetion for Vegetarian')
  end

  it('adds derfinetion') do
    visit('/words')
    click_link('Vegetarian')
    click_link('Add a new derfinetion')
    fill_in('def', :with => 'Hungry hungry')
    click_button('Add')
    expect(page).to have_content('Hungry hungry')
  end

  it('goes back to list of words from word definition page') do
    visit('/words')
    click_link('Vegetarian')
    click_link('Return to all words')
    expect(page).to have_content('Words')
  end

  it('goes back to main page from word definition page') do
    visit('/words')
    click_link('Vegetarian')
    click_link('Main Page')
    expect(page).to have_content('DERFINERTIONS AND WERDS')
  end

  it('goes back to main page from list of words page') do
    visit('/words')
    click_link('Main Page')
    expect(page).to have_content('DERFINERTIONS AND WERDS')
  end
end
