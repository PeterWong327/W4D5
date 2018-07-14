require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_button('Sign Up')
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'Test Name'
      fill_in 'password', with: 'password'
      click_on 'Sign Up'
    end
    
    scenario 'shows username on the homepage after signup' do
      visit users_url
      expect(page).to have_content 'Test Name'
    end
    
    scenario 'redirects user to their profile' do
      expect(page).to have_content 'Test Name\'s Profile'
    end
  end
end




feature 'logging in' do
  scenario 'shows username on the homepage after login'

end






feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end