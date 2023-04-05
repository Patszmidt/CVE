class AchatsController < ApplicationController
  before_action :set_achat, only: %i[ show edit update destroy livrer ]
  before_action :set_ressources

  # GET /achats or /achats.json
  def index
    if params[:tout] && params[:tout] == "1"
      achats = Achat.all.order(date_de_achat: :desc)
    else
      achats = Achat.where(livre: false).order(date_de_achat: :desc)
    end

    if params[:start_date].present?
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      @achats = Achats.where(date_de_achat: @start_date..@end_date).order(date_de_achat: :desc)
    else
      @achats = achats
    end
    
    if turbo_frame_request?
      render partial: "achats", locals: { achats: @achats }
    else
      render :index
    end
    
  end

  def livrer
    @achat.toggle(:livre)
    @achat.date_de_livraison = Date.today
    @achat.save
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(@achat, partial: @achat, locals: { achat: @achat }) 
        ]
        
      end
    end
  end

  def create_from
    @utilisation = Utilisation.find(params[:id])
    @achat = current_user.achats.create_from(@utilisation)
    @utilisation.checked = true
    @utilisation.save
    @achats = @utilisation.chantier.achats.order(date_de_achat: :desc)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("achats", partial: "achats", locals: { achats: @achats }),
          turbo_stream.replace("ressources_chantier", partial: "chantiers/ressources", locals: { chantier: @utilisation.chantier }),
          turbo_stream.replace(@utilisation, partial: @utilisation, locals: { utilisation: @utilisation }) 
        ] 
        
      end
    end

  end

  # GET /achats/1 or /achats/1.json
  def show
  end

  # GET /achats/new
  def new
    @achat = Achat.new
  end

  # GET /achats/1/edit
  def edit
  end

  # POST /achats or /achats.json
  def create
    @achat = current_user.achats.new(achat_params)

    respond_to do |format|
      if @achat.save
        format.html { redirect_to chantier_url(@achat.chantier), notice: "Achat was successfully created." }
        format.json { render :show, status: :created, location: @achat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achats/1 or /achats/1.json
  def update
    respond_to do |format|
      if @achat.update(achat_params)
        format.html { redirect_to chantier_url(@achat.chantier), notice: "Achat was successfully updated." }
        format.json { render :show, status: :ok, location: @achat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achats/1 or /achats/1.json
  def destroy
    @achat.destroy

    respond_to do |format|
      format.html { redirect_to achats_url, notice: "Achat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achat
      @achat = Achat.find(params[:id])
    end

    def set_ressources
      @ressources = Ressource.all.order(:matiere_id, :epaisseur, :couleur)
    end    

    # Only allow a list of trusted parameters through.
    def achat_params
      params.require(:achat).permit(:user_id, :chantier_id, :ressource_id, :date_de_achat, :date_de_livraison, :livre, :matiere_id, :quantite, :commentaire)
    end
end
