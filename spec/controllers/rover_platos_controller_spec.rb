require 'spec_helper'
RSpec.describe RoverPlatosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RoverPlato. As you add validations to RoverPlato, be sure to
  # adjust the attributes here as well.
  #let(:valid_attributes) {"x_position_size"=>"5", "y_position_size"=>"5"}
  let(:subject) {create(:rover_plato)}

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoverPlatosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
      expect(assigns(:rover_platos)).to eq([subject])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: subject.to_param}, session: valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: subject.to_param}, session: valid_session
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RoverPlato" do
        expect {
          post :create, params: {rover_plato: {"x_position_size"=>"5", "y_position_size"=>"5"}}, session: valid_session
        }.to change(RoverPlato, :count).by(1)
        expect(response.status).to eq(302)
      end

      it "redirects to the created rover_plato" do
        post :create, params: {rover_plato: {"x_position_size"=>"5", "y_position_size"=>"5"}}, session: valid_session
        expect(response.status).to eq(302)
        expect(response).to redirect_to(edit_rover_plato_rover_path(RoverPlato.last,RoverPlato.last.rover))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {rover_plato: {"x_position_size"=>"", "y_position_size"=>""}}, session: valid_session
        expect(response).not_to be_success
        expect(response.status).to eq(302)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {"x_position_size"=>"8", "y_position_size"=>"8"}
      }

      it "updates the requested rover_plato" do
        put :update, params: {id: subject.to_param, rover_plato: new_attributes}, session: valid_session
        subject.reload
        expect(response).to redirect_to(RoverPlato.last)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rover_plato" do
      expect {
        delete :destroy, params: {id: subject.to_param}, session: valid_session
      }.to change(RoverPlato, :count).by(0)
    end

    it "redirects to the rover_platos list" do
      delete :destroy, params: {id: subject.to_param}, session: valid_session
      expect(response).to redirect_to(rover_platos_url)
    end
  end

end
