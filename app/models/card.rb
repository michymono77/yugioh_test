class Card < ApplicationRecord
  has_one_attached :photo
  has_many :structures
  has_many :decks, through: :structures

  validates :name, presence: true
end
