require 'rails_helper'

describe 'DELETE /api/v1/users/:user_id/favorites/:id' do
  it 'can delete a favorite from the db' do
    user = create(:user)
    fave = create(:favorite, user_id: user.id)

    delete "/api/v1/users/#{user.id}/favorites/#{fave.id}"

    fave = JSON.parse(response.body)

    expect(fave["message"]).to eq("Favorite successfully deleted")
  end
end
