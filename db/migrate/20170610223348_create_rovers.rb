class CreateRovers < ActiveRecord::Migration[5.1]
  def change
    create_table :rovers do |t|
      t.references :rover_plato
      t.integer :x_position
      t.integer :y_position
      t.string :direction
      t.string :instruction
      t.integer :step
      t.timestamps
    end
  end
end
