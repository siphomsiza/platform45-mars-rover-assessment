class RoversController < ApplicationController
  before_action :set_rover_plato
  before_action :set_rover, only: [:show, :edit, :update, :destroy]

  # GET /rovers
  # GET /rovers.json
  def index
    @rovers = [@rover_plato.rover]
  end

  # GET /rovers/1
  # GET /rovers/1.json
  def show
  end

  # GET /rovers/new
  def new
    @rover = Rover.new
  end

  # GET /rovers/1/edit
  def edit
    @update = "true"
  end

  # POST /rovers
  # POST /rovers.json
  def create
    @rover = Rover.new(rover_params)

    respond_to do |format|
      if @rover.save
        format.html { redirect_to @rover, notice: 'Rover was successfully created.' }
        format.json { render :show, status: :created, location: @rover }
      else
        format.html { render :new }
        format.json { render json: @rover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rovers/1
  # PATCH/PUT /rovers/1.json
  def update
    if @rover.update(rover_params) && @rover.step < @rover.instruction.length
      flash[:success] = "submited rover challenge instruction #{@rover.instruction.split('').[]0..@rover.step-1}"
      #@rover.rover_step_go
    else
      flash[:success] = "You have finish to submit rover challenge" if @rover.errors.empty?
      flash[:alert] = @rover.errors.full_messages.join(" ") if @rover.errors.any?
    end
  end

  # DELETE /rovers/1
  # DELETE /rovers/1.json
  def destroy
    @rover.destroy
    respond_to do |format|
      format.html { redirect_to rovers_url, notice: 'Rover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rover
    @rover = @rover_plato.rover
  end

  def set_rover_plato
    @rover_plato = RoverPlato.find(params[:rover_plato_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rover_params
    params.require(:rover).permit(:x_position,:y_position,:direction,:instruction, rover_plato_attributes: [:id,:x_position_size, :y_position_size, :_destroy])
  end
end
