class RoverPlato < ApplicationRecord
  has_one :rover, :dependent => :delete
  before_validation :initialize_position_sizes,on: [:create]

  validates :x_position_size,:y_position_size,presence: true
  validates_numericality_of :x_position_size,:y_position_size, less_than_or_equal_to: 10

  def initialize_position_sizes
    self.x_position_size = 5
    self.y_position_size = 5
  end

  def position
    { [self.rover.x_position, self.rover.y_position] => 1 }
  end

  def exist?(x, y)
    (x >= 0) && (x < self.x_position_size) && (y >= 0) && (y < self.y_position_size)
  end
end
