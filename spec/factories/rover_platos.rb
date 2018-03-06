FactoryGirl.define do
  factory :rover_plato do
    x_position_size {8}
    y_position_size {8}

    after(:build) do |rover_plato|
      rover_plato.rover ||= FactoryGirl.build(:rover, :rover_plato => rover_plato)
    end
  end
end
