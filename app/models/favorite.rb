class Favorite < ApplicationRecord
  validates_presence_of :title, :source, :url
  validates_uniqueness_of :url

  belongs_to :user
end
