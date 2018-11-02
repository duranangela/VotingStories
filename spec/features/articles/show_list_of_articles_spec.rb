require 'rails_helper'

describe 'list of articles' do
  it 'shows a list of articles on the main page' do
    visit '/'

    expect(page).to have_css('.articles')
  end
end
