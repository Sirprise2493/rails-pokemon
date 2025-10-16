Rails.application.routes.draw do
  root "pokedex#index"
  resources :pokemons, only: [:index, :show] do
    resources :pokeballs, only: :create
  end
  resources :trainers, only: [:index, :show] do
    resources :pokeballs, only: :destroy
  end
end
