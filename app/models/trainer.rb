class Trainer < ApplicationRecord
  has_many :pokeballs, dependent: :destroy
  has_many :pokemons, through: :pokeballs

  validates :name, presence: true, length: { maximum: 120 }
  validates :age,  presence: true, numericality: { only_integer: true, in: 0..120 }


  has_one_attached :photo
end
