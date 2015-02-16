class DrinktwosController < ApplicationController
  before_action :set_drinktwo, only: [:show, :edit, :update, :destroy]

  # GET /drinktwos
  # GET /drinktwos.json
  def index
    @drinktwos = Drinktwo.all
  end

  # GET /drinktwos/1
  # GET /drinktwos/1.json
  def show
  end

  # GET /drinktwos/new
  def new
    @drinktwo = Drinktwo.new
  end

  # GET /drinktwos/1/edit
  def edit
  end

  # POST /drinktwos
  # POST /drinktwos.json
  def create
    @drinktwo = Drinktwo.new(drinktwo_params)

    respond_to do |format|
      if @drinktwo.save
        format.html { redirect_to @drinktwo, notice: 'Drinktwo was successfully created.' }
        format.json { render :show, status: :created, location: @drinktwo }
      else
        format.html { render :new }
        format.json { render json: @drinktwo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinktwos/1
  # PATCH/PUT /drinktwos/1.json
  def update
    respond_to do |format|
      if @drinktwo.update(drinktwo_params)
        format.html { redirect_to @drinktwo, notice: 'Drinktwo was successfully updated.' }
        format.json { render :show, status: :ok, location: @drinktwo }
      else
        format.html { render :edit }
        format.json { render json: @drinktwo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinktwos/1
  # DELETE /drinktwos/1.json
  def destroy
    @drinktwo.destroy
    respond_to do |format|
      format.html { redirect_to drinktwos_url, notice: 'Drinktwo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drinktwo
      @drinktwo = Drinktwo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drinktwo_params
      params.require(:drinktwo).permit(:name, :temperature)
    end
end
