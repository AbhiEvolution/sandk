class TreatementtypesController < ApplicationController
  before_action :set_treatementtype, only: %i[ show edit update destroy ]

  # GET /treatementtypes or /treatementtypes.json
  def index
    @treatementtypes = Treatementtype.all
  end

  # GET /treatementtypes/1 or /treatementtypes/1.json
  def show
  end

  # GET /treatementtypes/new
  def new
    @treatementtype = Treatementtype.new
  end

  # GET /treatementtypes/1/edit
  def edit
  end

  # POST /treatementtypes or /treatementtypes.json
  def create
    @treatementtype = Treatementtype.new(treatementtype_params)

    respond_to do |format|
      if @treatementtype.save
        format.html { redirect_to treatementtype_url(@treatementtype), notice: "Treatementtype was successfully created." }
        format.json { render :show, status: :created, location: @treatementtype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatementtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatementtypes/1 or /treatementtypes/1.json
  def update
    respond_to do |format|
      if @treatementtype.update(treatementtype_params)
        format.html { redirect_to treatementtype_url(@treatementtype), notice: "Treatementtype was successfully updated." }
        format.json { render :show, status: :ok, location: @treatementtype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatementtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatementtypes/1 or /treatementtypes/1.json
  def destroy
    @treatementtype.destroy

    respond_to do |format|
      format.html { redirect_to treatementtypes_url, notice: "Treatementtype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatementtype
      @treatementtype = Treatementtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatementtype_params
      params.require(:treatementtype).permit(:name)
    end
end
