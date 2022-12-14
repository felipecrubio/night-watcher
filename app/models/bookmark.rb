class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, :list, presence: true, allow_blank: false
  validates :movie, uniqueness: { scope: :list }
end
