class TrainersController < ApplicationController
  def index
    @trainers = Trainer.with_attached_photo.order(:name)
  end

  def show
    @trainer  = Trainer.with_attached_photo.find(params[:id])
    @pokemons = @trainer.pokemons.with_attached_photo.order(:name)
  end
end
