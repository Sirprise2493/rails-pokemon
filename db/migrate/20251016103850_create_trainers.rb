# db/migrate/20251016120500_create_trainers.rb
class CreateTrainers < ActiveRecord::Migration[7.1]
  def change
    create_table :trainers do |t|
      t.string  :name, null: false
      t.integer :age,  null: false
      t.timestamps
    end

    add_index :trainers, :name
    # optional:
    # add_check_constraint :trainers, "age BETWEEN 0 AND 120", name: "trainers_age_range"
  end
end
