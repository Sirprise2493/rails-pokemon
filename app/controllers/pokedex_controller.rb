class PokedexController < ApplicationController
  def index
    @pokemons  = Pokemon.with_attached_photo.includes(pokeball: :trainer).order(:name)
    @all_names = Pokemon.order(:name).pluck(:name)

    q = params[:q].to_s.strip
    return if q.blank?

    # exakter Treffer? → direkt zur Show
    if (exact = Pokemon.find_by("LOWER(name) = ?", q.downcase))
      redirect_to pokemon_path(exact) and return
    end

    # sonst: Ergebnisse in der Liste filtern
    @pokemons = @pokemons.where("name ILIKE ?", "%#{q}%")
  end
end
