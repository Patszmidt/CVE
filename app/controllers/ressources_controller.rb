class RessourcesController < ApplicationController
  before_action :set_ressource, only: %i[ show edit update destroy ]
  before_action :set_matieres

  # GET /ressources or /ressources.json
  def index
    @ressources = Ressource.all.order(:matiere_id, :epaisseur, :couleur)
  end

  # GET /ressources/1 or /ressources/1.json
  def show
  end

  # GET /ressources/new
  def new
    @ressource = Ressource.new
  end

  # GET /ressources/1/edit
  def edit
  end

  # POST /ressources or /ressources.json
  def create
    @ressource = Ressource.new(ressource_params)

    respond_to do |format|
      if @ressource.save
        format.html { redirect_to ressource_url(@ressource), notice: "Ressource was successfully created." }
        format.json { render :show, status: :created, location: @ressource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ressource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ressources/1 or /ressources/1.json
  def update
    respond_to do |format|
      if @ressource.update(ressource_params)
        format.html { redirect_to ressource_url(@ressource), notice: "Ressource was successfully updated." }
        format.json { render :show, status: :ok, location: @ressource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ressource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ressources/1 or /ressources/1.json
  def destroy
    @ressource.destroy

    respond_to do |format|
      format.html { redirect_to ressources_url, notice: "Ressource was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ressource
      @ressource = Ressource.find(params[:id])
    end
    
    def set_matieres
      @matieres = Matiere.all
    end

    # Only allow a list of trusted parameters through.
    def ressource_params
      params.require(:ressource).permit(:epaisseur, :dimension, :matiere_id, :couleur, :qualite)
    end
end
