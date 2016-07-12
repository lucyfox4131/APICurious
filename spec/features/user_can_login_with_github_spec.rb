require 'rails_helper'

RSpec.feature "User Logs in" do
  before do
    mock_omniauth
  end

  scenario "User can successfully login with github" do
    visit root_path
    expect(page).to have_content "Login with Github"

    click_link "Login with Github"
    expect(page).to have_content("Hello, mockuser")
    expect(page).to have_link("Logout")
  end
  
end
