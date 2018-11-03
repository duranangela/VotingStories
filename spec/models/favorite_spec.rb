require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:source)}
    it {should validate_presence_of(:url)}
    it {should validate_uniqueness_of(:url)}
  end
  describe 'relationships' do
    it {should belong_to(:user)}
  end
end
