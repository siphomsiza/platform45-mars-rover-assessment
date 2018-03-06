require 'spec_helper'

RSpec.describe RoverPlato do
  let(:subject) {create(:rover_plato)}
  let(:record){ FactoryGirl.build(:rover_plato) }
  it{ expect(record._validation_callbacks.select{|cb| cb.kind.eql?(:before)}.collect(&:filter)).to include(:initialize_position_sizes) }

  #Respond to relationship has one rover
  it { expect(subject).to respond_to :rover }

  #Respond to attributes
  context "attrs" do
    it { expect(subject).to respond_to :x_position_size }
    it { expect(subject).to respond_to :y_position_size }
  end

  #validate the present of attributes
  it { is_expected.to validate_presence_of(:x_position_size) }
  it { is_expected.to validate_presence_of(:x_position_size) }

  #validate the numericality_of attributes it must be number only
  it { is_expected.to validate_numericality_of(:x_position_size) }
  it { is_expected.to validate_numericality_of(:x_position_size) }

  it { should have_one(:rover) }

  describe "Methods" do
    describe "#as_json" do
      context "when invoking with no params" do
        let(:json){ subject.to_json }
        it "should return a json with just id, x_position_size ,y_position_size, created_at and updated_at" do
          expect(json).to eql(subject.to_json(:only => [:id,:x_position_size,:y_position_size,:created_at,:updated_at]) )
        end
      end

      context "when invoking with options" do
        let(:json){ subject.to_json(:only => [:id, :x_position_size]) }
        it "should call to super with that options" do
          expect(json).to eql(%({"id":#{subject.id},"x_position_size":#{subject.x_position_size}}))
        end
      end
    end
  end

  describe :initialize_position_sizes do
    subject{ record.send(:initialize_position_sizes)}
    it "should initialize position sizes" do
      expect(subject).to eql(5)
    end
  end

  context "validations" do
    it "validates x_position_size not valid" do
      subject.x_position_size = nil
      expect(subject).not_to be_valid

      subject.x_position_size = ''
      expect(subject).not_to be_valid
    end

    it "validates y_position_size not valid" do
      subject.y_position_size = nil
      expect(subject).not_to be_valid

      subject.y_position_size = ''
      expect(subject).not_to be_valid
    end
  end
end
