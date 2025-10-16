class Pokemon < ApplicationRecord
  has_one  :pokeball, dependent: :destroy
  has_one :trainer, through: :pokeball

  ELEMENTS = %w[
    normal fire water grass electric ice fighting poison ground flying
    psychic bug rock ghost dragon dark steel fairy
  ].freeze

  validates :name, presence: true
  validates :element_type, presence: true, inclusion: { in: ELEMENTS }


  has_one_attached :photo
end
