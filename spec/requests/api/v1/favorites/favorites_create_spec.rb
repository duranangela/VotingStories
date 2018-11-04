require 'rails_helper'

describe 'POST /api/v1/users/:user_id/favorites' do
  it 'can create a new favorite' do
    user = create(:user)

    headers = {"Content-Type": 'application/json'}

    body = {
      favorite: {
          title: "some title",
          source: "some source",
          url: "url.com"
      }
    }

    post "/api/v1/users/#{user.id}/favorites", params: body.to_json, headers: headers

    fave = JSON.parse(response.body)

    expect(fave["message"]).to eq("Favorite created")
  end
  it 'cannot create a new favorite with missing params' do
    user = create(:user)

    headers = {"Content-Type": 'application/json'}

    body = {
      favorite: {
          title: "some title",
          source: "some source",
      }
    }

    post "/api/v1/users/#{user.id}/favorites", params: body.to_json, headers: headers

    fave = JSON.parse(response.body)

    expect(fave["message"]).to eq("Unable to create favorite")
  end
  it 'cannot create a favorite if already exists in the db' do
    user = create(:user)
    fave = user.favorites.create(title: 'title', source: 'source', url: 'url.com')

    headers = {"Content-Type": 'application/json'}

    body = {
      favorite: {
          title: "some title",
          source: "some source",
          url: "url.com"
      }
    }

    post "/api/v1/users/#{user.id}/favorites", params: body.to_json, headers: headers

    fave = JSON.parse(response.body)

    expect(fave["message"]).to eq("Favorite already exists")
  end
end
