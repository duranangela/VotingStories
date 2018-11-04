require 'rails_helper'

describe 'favorites index' do
  it 'shows a list of users favorite titles' do
    user = User.create(username: 'fred', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    favorite1 = user.favorites.create(title: 'a title', source: 'a source', url: 'some url')
    favorite2 = user.favorites.create(title: 'other title', source: 'other source', url: 'other url')

    visit user_favorites_path(user)

    expect(page).to have_content(favorite1.title)
    expect(page).to have_content(favorite1.source)
    expect(page).to have_content(favorite2.title)
    expect(page).to have_content(favorite2.source)
  end
end
