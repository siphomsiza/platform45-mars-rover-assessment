class CreateRoverPlatos < ActiveRecord::Migration[5.1]
  def change
    create_table :rover_platos do |t|
      t.integer :x_position_size
      t.integer :y_position_size
      t.timestamps
    end
  end
end
