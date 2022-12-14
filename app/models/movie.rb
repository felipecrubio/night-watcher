class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: { case_sensitive: false }, allow_blank: false
  validates :overview, presence: true, allow_blank: false
end
