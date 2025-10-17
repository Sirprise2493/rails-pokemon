class TrainersController < ApplicationController
  def index
    @trainers = Trainer.with_attached_photo.order(:name)
  end

  def show
    @trainer  = Trainer.with_attached_photo.find(params[:id])
    @pokemons = @trainer.pokemons.with_attached_photo.order(:name)
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)

    if @trainer.save
      redirect_to trainers_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trainer_params
    params.require(:trainer).permit(:age, :name, :photo)
  end
end
