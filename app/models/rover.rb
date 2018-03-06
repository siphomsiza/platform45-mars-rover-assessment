class Rover < ApplicationRecord
  belongs_to :rover_plato
  instruction_regex = /\A[MRL]+\z/

  validates :instruction, :format  => { :with => instruction_regex },
                          :length  => { :maximum => 20 },:on      => :update

  validates :direction,:x_position,:y_position, presence: true,:on => :update
  validates_numericality_of :x_position,:y_position, less_than_or_equal_to: 10 ,:on => :update
  validates_inclusion_of :direction, :in => %w( E W N S ) , :message => "direction is not included in the list (E W N S)",:on => :update
  validates :direction, length: { minimum: 1 },:on => :update

  before_create :initialize_positions_direction_step
  before_validation :initialize_direction
  accepts_nested_attributes_for :rover_plato

  def initialize_positions_direction_step
    self.x_position = 1
    self.y_position = 2
    self.direction = 'N'
    self.step = 0
  end

  def initialize_direction
    self.direction = self.direction.upcase if self.direction.present?
  end

  def self.authenticate_with_cookie(id)
    rover = find_by_id(id)
  end

  def rover_step_go
    case split_instruction
    when "L"
      left_direction
    when "R"
      right_direction
    when "M"
      move_direction
    end
    self.step += 1
    self.save
  end

  def split_instruction
    self.instruction.split('')[self.step]
  end

  def left_direction
    self.direction = RoverDirection.previous_direction(self.direction)
  end

  def right_direction
    self.direction = RoverDirection.next_direction(self.direction)
  end

  def move_direction
    if rover_plato.exist?(*next_position)
      self.x_position, self.y_position = *next_position
    end
  end

  def next_position
    move_x, move_y = *RoverDirection.move_direction(self.direction)
    [self.x_position + move_x, self.y_position + move_y]
  end

end
