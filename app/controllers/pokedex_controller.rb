class PokedexController < ApplicationController
  def index
    @pokemons = Pokemon.with_attached_photo.includes(pokeball: :trainer).order(:name)
  end
end
