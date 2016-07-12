require 'rails_helper'

RSpec.feature "User Logs in" do
  scenario "User can successfully login with github" do
    # user = User.from_omniauth(uid: '1234', name: 'Lucy')
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    mock_omniauth

    visit root_path
    expect(page).to have_content "Login with Github"

    click_link "Login with Github"
    expect(page).to have_content("Lucy")
    expect(page).to have_link("Logout")
  end
end
