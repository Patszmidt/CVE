class ChantiersController < ApplicationController
  before_action :set_chantier, only: %i[ show edit update destroy ]
  before_action :set_clients

  # GET /chantiers or /chantiers.json
  def index
    @chantiers = Chantier.all.order(:nom)
  end

  # GET /chantiers/1 or /chantiers/1.json
  def show
    @utilisations = @chantier.utilisations.order(created_at: :desc)
    @achats = @chantier.achats.order(created_at: :desc)
    @utilisations_virtuelles = @chantier.utilisations_virtuelles
  end

  def list
    @chantiers = Chantier.all
    @chantiers = @chantiers.where('nom ilike ?', "%#{params[:nom]}%") if params[:nom].present?
    if params[:column] == "client"
      @chantiers = @chantiers.sort_by{|c| c.client.nom}
      if params[:direction] == "desc"
        @chantiers.reverse!
      end
    elsif params[:column] == "achats"
      @chantiers = @chantiers.sort_by{|c| c.equilibre? ? 0 : 1}
      if params[:direction] == "desc"
        @chantiers.reverse!
      end
    else
      @chantiers = @chantiers.order("#{params[:column]} #{params[:direction]}")
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('chantiers', partial: 'chantiers', locals: { chantiers: @chantiers }) 
        ]
      end
    end
  end

  # GET /chantiers/new
  def new
    @chantier = Chantier.new
  end

  # GET /chantiers/1/edit
  def edit
  end

  # POST /chantiers or /chantiers.json
  def create
    @chantier = Chantier.new(chantier_params)

    respond_to do |format|
      if @chantier.save
        format.html { redirect_to chantier_url(@chantier), notice: "Chantier was successfully created." }
        format.json { render :show, status: :created, location: @chantier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chantier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chantiers/1 or /chantiers/1.json
  def update
    respond_to do |format|
      if @chantier.update(chantier_params)
        format.html { redirect_to chantier_url(@chantier), notice: "Chantier was successfully updated." }
        format.json { render :show, status: :ok, location: @chantier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chantier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chantiers/1 or /chantiers/1.json
  def destroy
    @chantier.destroy

    respond_to do |format|
      format.html { redirect_to chantiers_url, notice: "Chantier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chantier
      @chantier = Chantier.find(params[:id])
    end
    
    def set_clients
      @clients = Client.all
    end

    # Only allow a list of trusted parameters through.
    def chantier_params
      params.require(:chantier).permit(:nom, :client_id, :date_de_livraison, :livre)
    end
end
