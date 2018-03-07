class RoverPlatosController < ApplicationController
  before_action :set_rover_plato, only: [:show, :edit, :update, :destroy]

  # GET /rover_platos
  # GET /rover_platos.json
  def index
    @rover_platos = RoverPlato.paginate(page: params[:page], per_page: 10)
  end

  # GET /rover_platos/1
  # GET /rover_platos/1.json
  def show
  end

  # GET /rover_platos/new
  def new
    @rover_plato = RoverPlato.new
  end

  # GET /rover_platos/1/edit
  def edit
  end

  # POST /rover_platos
  # POST /rover_platos.json
  def create
    @rover_plato = RoverPlato.create!
    @rover = @rover_plato.create_rover
    rover_start @rover

    respond_to do |format|
      if @rover.present?
        format.html { redirect_to edit_rover_plato_rover_path(@rover_plato,@rover), notice: 'Rover Challenge was successfully started.' }
        format.json { render :show, status: :created, location: @rover_plato }
      else
        format.html { render :new }
        format.json { render json: @rover_plato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rover_platos/1
  # PATCH/PUT /rover_platos/1.json
  def update
    respond_to do |format|
      if @rover_plato.update(rover_plato_params)
        format.html { redirect_to @rover_plato, notice: 'Rover plato was successfully updated.' }
        format.json { render :show, status: :ok, location: @rover_plato }
      else
        format.html { render :edit }
        format.json { render json: @rover_plato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rover_platos/1
  # DELETE /rover_platos/1.json
  def destroy
    @rover_plato.destroy
    respond_to do |format|
      format.html { redirect_to rover_platos_url, notice: 'Rover plato was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rover_plato
      @rover_plato = RoverPlato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rover_plato_params
      params.require(:rover_plato).permit(:x_position_size, :y_position_size)
    end
end
