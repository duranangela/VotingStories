class Favorite < ApplicationRecord
  validates_presence_of :title, :source, :url

  belongs_to :user
end
