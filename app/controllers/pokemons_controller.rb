class PokemonsController < ApplicationController
  def show
    @pokemon = Pokemon.with_attached_photo.includes(pokeball: :trainer).find(params[:id])

    existing = @pokemon.pokeball
    @caught  = existing.present?          # oder: existing&.persisted?
    @pokeball = existing || @pokemon.build_pokeball

    @trainers = Trainer.order(:name)
  end
end
