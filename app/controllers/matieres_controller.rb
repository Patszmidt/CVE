class MatieresController < ApplicationController
  before_action :set_matiere, only: %i[ show edit update destroy ]

  # GET /matieres or /matieres.json
  def index
    @matieres = Matiere.all.order(:nom)
  end

  # GET /matieres/1 or /matieres/1.json
  def show
  end

  # GET /matieres/new
  def new
    @matiere = Matiere.new
  end

  # GET /matieres/1/edit
  def edit
  end

  # POST /matieres or /matieres.json
  def create
    @matiere = Matiere.new(matiere_params)

    respond_to do |format|
      if @matiere.save
        format.html { redirect_to matiere_url(@matiere), notice: "Matiere was successfully created." }
        format.json { render :show, status: :created, location: @matiere }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matiere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matieres/1 or /matieres/1.json
  def update
    respond_to do |format|
      if @matiere.update(matiere_params)
        format.html { redirect_to matiere_url(@matiere), notice: "Matiere was successfully updated." }
        format.json { render :show, status: :ok, location: @matiere }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matiere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matieres/1 or /matieres/1.json
  def destroy
    @matiere.destroy

    respond_to do |format|
      format.html { redirect_to matieres_url, notice: "Matiere was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matiere
      @matiere = Matiere.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matiere_params
      params.require(:matiere).permit(:nom)
    end
end
