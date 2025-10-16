# app/models/pokeball.rb
class Pokeball < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokemon, dependent: :destroy

  validates :caught_on, presence: true
  validates :location,  presence: true, length: { maximum: 200 }

  validate :caught_on_not_in_future

  private

  def caught_on_not_in_future
    errors.add(:caught_on, "kann nicht in der Zukunft liegen") if caught_on.present? && caught_on > Date.current
  end
end
