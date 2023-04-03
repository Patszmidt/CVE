class CommandesController < ApplicationController
  before_action :set_commande, only: %i[ show edit update destroy livrer ]
  before_action :set_ressources

  # GET /commandes or /commandes.json
  def index
    if params[:tout] && params[:tout] == "1"
      commandes = Commande.all.order(date_de_commande: :desc)
    else
      commandes = Commande.where(livre: false).order(date_de_commande: :desc)
    end

    if params[:start_date].present?
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      @commandes = Commandes.where(date_de_commande: @start_date..@end_date).order(date_de_commande: :desc)
    else
      @commandes = commandes
    end
    
    if turbo_frame_request?
      render partial: "commandes", locals: { commandes: @commandes }
    else
      render :index
    end
    
  end

  def livrer
    @commande.toggle(:livre)
    @commande.date_de_livraison = Date.today
    @commande.save
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(@commande, partial: @commande, locals: { commande: @commande }) 
        ]
        
      end
    end
  end

  def create_from
    @utilisation = Utilisation.find(params[:id])
    @commande = current_user.commandes.create_from(@utilisation)
    @utilisation.checked = true
    @utilisation.save
    @commandes = @utilisation.chantier.commandes.order(date_de_commande: :desc)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("commandes", partial: "commandes", locals: { commandes: @commandes }),
          turbo_stream.replace(@utilisation, partial: @utilisation, locals: { utilisation: @utilisation }) 
        ]
        
      end
    end

  end

  # GET /commandes/1 or /commandes/1.json
  def show
  end

  # GET /commandes/new
  def new
    @commande = Commande.new
  end

  # GET /commandes/1/edit
  def edit
  end

  # POST /commandes or /commandes.json
  def create
    @commande = current_user.commandes.new(commande_params)

    respond_to do |format|
      if @commande.save
        format.html { redirect_to chantier_url(@commande.chantier), notice: "Commande was successfully created." }
        format.json { render :show, status: :created, location: @commande }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commande.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commandes/1 or /commandes/1.json
  def update
    respond_to do |format|
      if @commande.update(commande_params)
        format.html { redirect_to chantier_url(@commande.chantier), notice: "Commande was successfully updated." }
        format.json { render :show, status: :ok, location: @commande }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commande.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commandes/1 or /commandes/1.json
  def destroy
    @commande.destroy

    respond_to do |format|
      format.html { redirect_to commandes_url, notice: "Commande was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commande
      @commande = Commande.find(params[:id])
    end

    def set_ressources
      @ressources = Ressource.all.order(:matiere_id, :epaisseur, :couleur)
    end    

    # Only allow a list of trusted parameters through.
    def commande_params
      params.require(:commande).permit(:user_id, :chantier_id, :ressource_id, :date_de_commande, :date_de_livraison, :livre, :matiere_id, :quantite, :commentaire)
    end
end
