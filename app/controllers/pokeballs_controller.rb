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
    @pokeball = @pokemon.build_pokeball(pokeball_params)

    if @pokeball.save
      redirect_to pokemon_path(@pokemon), notice: "#{@pokemon.name} was catched"
    else
      @trainers = Trainer.order(:name) # fürs Formular bei Fehlern
      render "pokemons/show", status: :unprocessable_entity
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
