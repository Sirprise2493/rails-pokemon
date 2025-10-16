class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name,         null: false
      t.string :element_type, null: false

      t.timestamps
    end
    add_index :pokemons, :element_type
  end
end
