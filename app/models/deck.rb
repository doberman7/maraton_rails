class Deck < ApplicationRecord
  has_many :user_decks
  has_many :users, through: :user_decks

  has_many :items
end
