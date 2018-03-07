require 'spec_helper'

RSpec.describe RoversController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Rover. As you add validations to Rover, be sure to
  # adjust the attributes here as well.
  let(:subject) {create(:rover)}

  let(:valid_attributes) {
    {rover_plato_id: subject.rover_plato_id,x_position: 1 ,y_position: 2, direction: "E",
        instruction:"MMLMRMMRRMML",
        step: 0}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoversController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {rover_plato_id: subject.rover_plato_id}, session: valid_session
      expect(response).to be_success
      expect(assigns(:rovers)).to eq([subject])
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {rover_plato_id: subject.rover_plato_id,id: subject.to_param}, session: valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {rover_plato_id: subject.rover_plato_id}, session: valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {rover_plato_id: subject.rover_plato_id,id: subject.to_param}, session: valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Rover" do
        expect {
          post :create, params: {rover_plato_id: subject.rover_plato_id,rover: valid_attributes}, session: valid_session
        }.to change(Rover, :count).by(3)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {x_position: 1 ,y_position: 3, direction: "N",instruction:"MMLMRMMRRMMLLL"}
      }

      it "updates the requested rover" do
        put :update, params: {rover_plato_id: subject.rover_plato_id,id: subject.to_param, rover: new_attributes,format: ["text/html"]}, session: valid_session
        subject.reload
        expect(subject.y_position).to eq(3)
        expect(subject.direction).to eq("N")
        expect(subject.instruction).to eq("MMLMRMMRRMMLLL")
      end

      it "redirects to the rover" do
        rover = Rover.create! valid_attributes
        put :update, params: {rover_plato_id: subject.rover_plato_id,id: rover.to_param, rover: valid_attributes,format: ["text/html"]}, session: valid_session
        expect(response.status).to eq(200)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rover" do
      expect {
        delete :destroy, params: {rover_plato_id: subject.rover_plato_id,id: subject.to_param}, session: valid_session
      }.to change(Rover, :count).by(1)
    end

    it "redirects to the rovers list" do
      delete :destroy, params: {rover_plato_id: subject.rover_plato_id,id: subject.to_param}, session: valid_session
      expect(response).to redirect_to(rover_plato_rovers_url(subject.rover_plato))
    end
  end

end
