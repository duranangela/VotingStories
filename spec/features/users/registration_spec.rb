require 'rails_helper'

describe 'registration process' do
  it 'submits registration form successfully' do
    username = "jorj"

    visit '/'

    click_on "Sign Up to Be a User"

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: 'password'

    click_on 'Create User'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome")
  end
end
