FactoryGirl.define do
  factory :rover do
    association(:rover_plato)
    x_position {1}
    y_position {2}
    direction {"E"}
    instruction {"MMLMRMMRRMML"}
    step {0}
  end
end
