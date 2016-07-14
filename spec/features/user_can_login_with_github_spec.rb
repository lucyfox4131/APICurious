require 'rails_helper'

RSpec.feature "User Logs in" do
  scenario "User can successfully login with github" do
    VCR.use_cassette("user_login") do
      mock_omniauth
      visit root_path

      expect(page).to have_content("Welcome, Sign In With Github")
      expect(page).to have_button("Login with Github")

      click_button "Login with Github"

      expect(current_path).to eq(dashboard_path('lucyfox4131'))
      expect(page).to have_content("Hello, Lucy Fox")
      expect(page).to have_button("Logout")
    end
  end
end
