class PokeballsController < ApplicationController
  def destroy
    trainer  = Trainer.find(params[:trainer_id])
    pokeball = trainer.pokeballs.find(params[:id]) # scoped: nur Pokeballs dieses Trainers
    name = pokeball.pokemon.name
    pokeball.destroy  # (löscht bei dir auch das Pokemon, falls dependent: :destroy gesetzt)
    redirect_to trainer_path(trainer), notice: "#{name} was let go."
  end

  def create
    @pokemon  = Pokemon.find(params[:pokemon_id])

    # Falls du has_one :pokeball nutzt und das Pokémon schon gefangen ist:
    if @pokemon.pokeball&.persisted?
      redirect_to pokemon_path(@pokemon), alert: "#{@pokemon.name} is already caught."
      return
    end

    @pokeball = @pokemon.build_pokeball(pokeball_params)

    # 50/50 – benutze, was dir lieber ist:
    caught = rand(2).zero?

    if caught
      if @pokeball.save
        redirect_to pokemon_path(@pokemon), notice: "#{@pokemon.name} was caught!"
      else
        @trainers = Trainer.order(:name)
        flash.now[:alert] = "Could not catch #{@pokemon.name}."
        render "pokemons/show", status: :unprocessable_entity
      end
    else
      # Nicht gespeichert – Formular mit Fehlermeldung erneut zeigen
      @pokeball.errors.add(:base, "#{@pokemon.name} escaped!")
      @trainers = Trainer.order(:name)
      flash.now[:alert] = "#{@pokemon.name} escaped!"
      render "pokemons/show", status: :unprocessable_entity
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
