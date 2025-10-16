class CreatePokeballs < ActiveRecord::Migration[7.1]
  def change
    create_table :pokeballs do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.date   :caught_on, null: false
      t.string :location,  null: false

      t.timestamps
    end
  end
end
