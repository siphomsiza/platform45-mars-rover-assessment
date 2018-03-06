class RoverDirection

  def self.next_direction(direction)
    all = ['N','W','S','E']
    all[all.find_index(direction)-1]
  end

  def self.previous_direction(direction)
    all = ['N','E','S','W']
    all[all.find_index(direction)-1]
  end

  def self.move_direction(direction)
    move_rules = {'E' => [1,0], 'N' => [0,1], 'W' => [-1,0], 'S' => [0,-1]}
    move_rules[direction]
  end
end
