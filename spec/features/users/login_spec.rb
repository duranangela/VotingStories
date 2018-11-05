require 'rails_helper'

describe 'login process' do
  it 'allows registered users to log in successfully' do
    user = create(:user)

    visit '/'
    click_on 'Log In'
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'User Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome")
    expect(page).to have_content("Log Out")
  end
  it 'allows registered users to log out' do
    user = create(:user)

    visit '/'
    click_on 'Log In'
    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on 'User Log In'
    click_on 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Log In")
  end
end
