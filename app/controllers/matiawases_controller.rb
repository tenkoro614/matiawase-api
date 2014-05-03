class MatiawasesController < ApplicationController
  before_action :set_matiawase, only: [:show, :edit, :update, :destroy]

  # GET /matiawases
  # GET /matiawases.json
  def index
    @matiawases = Matiawase.all
  end

  # GET /matiawases/1
  # GET /matiawases/1.json
  def show
  end

  # GET /matiawases/new
  def new
    @matiawase = Matiawase.new
  end

  # GET /matiawases/1/edit
  def edit
  end

  # POST /matiawases
  # POST /matiawases.json
  def create
    @matiawase = Matiawase.new(matiawase_params)

    respond_to do |format|
      if @matiawase.save
        format.html { redirect_to @matiawase, notice: 'Matiawase was successfully created.' }
        format.json { render action: 'show', status: :created, location: @matiawase }
      else
        format.html { render action: 'new' }
        format.json { render json: @matiawase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matiawases/1
  # PATCH/PUT /matiawases/1.json
  def update
    respond_to do |format|
      if @matiawase.update(matiawase_params)
        format.html { redirect_to @matiawase, notice: 'Matiawase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @matiawase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matiawases/1
  # DELETE /matiawases/1.json
  def destroy
    @matiawase.destroy
    respond_to do |format|
      format.html { redirect_to matiawases_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matiawase
      @matiawase = Matiawase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matiawase_params
      params.require(:matiawase).permit(:groupname, :devid, :username, :iconSelect, :latitude, :longitude, :gpsAccuracy, :deviceToken)
    end
end
