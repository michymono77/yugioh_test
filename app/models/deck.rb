class Deck < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :structures, dependent: :destroy
  has_many :cards, through: :decks
end
