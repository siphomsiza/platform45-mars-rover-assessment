require 'spec_helper'

RSpec.describe Rover, :type => :model do
  let(:subject) {create(:rover)}

  #Respond to relationship belong to rover_plato
  it { expect(subject).to respond_to :rover_plato }

  #Respond to attributes
  context "attrs" do
    it { expect(subject).to respond_to :x_position }
    it { expect(subject).to respond_to :y_position }
  end

  context "validations" do
    it "validates rover not valid" do
      #validate presence of direction
      subject.direction = nil
      expect(subject).not_to be_valid

      #validate presence of x_position
      subject.x_position = ''
      expect(subject).not_to be_valid

      # validate presence of y_position
      subject.y_position = ''
      expect(subject).not_to be_valid
    end

    it "validates numericality x_position and y_position of rover" do
      should validate_numericality_of(:x_position).on(:update)
      should validate_numericality_of(:y_position).on(:update)
    end

    it "validates is_less_than_or_equal_to 10 x_position and y_position of rover" do
      should validate_numericality_of(:x_position).is_less_than_or_equal_to(10)
    end

    it "validates direction validates_inclusion_of E W N S" do
      should validate_inclusion_of(:direction).in_array(%w( E W N S )).on(:update)
    end

    it "validates direction length 1" do
      should validate_length_of(:direction).is_at_least(1).on(:update)
    end
  end

  context "before create initialize x_position, y_position,direction and step" do
    it "default x position 1" do
      x_position = subject.x_position
      expect(x_position).to eql(1)
    end

    it "default y position 2" do
      y_position = subject.y_position
      expect(y_position).to eql(2)
    end

    it "default direction N" do
      direction = subject.direction
      expect(direction).to eql('N')
    end

    it "default Step 0" do
      step = subject.step
      expect(step).to eql(0)
    end
  end

  context "rover step go" do
    it "instruction LMLMLMLMM" do
      step_count = 0
      ["L","M","L","M","L","M","L","M","M"].each do |inst|
        subject.instruction = inst
        subject.rover_step_go
        step_count += 1
        expect(subject.step).to eql(step_count)
      end
    end
  end
end
