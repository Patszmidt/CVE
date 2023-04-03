class UtilisationsController < ApplicationController
  before_action :set_utilisation, only: %i[ show edit update destroy traiter]
  before_action :set_ressources

  # GET /utilisations or /utilisations.json
  def index
    if params[:tout] && params[:tout] == "1"
      @utilisations = Utilisation.all
    else
      @utilisations = Utilisation.where(checked: false)
    end

    if params[:start_date].present? && params[:end_date].present?
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      @utilisations = @utilisations.where(date: @start_date..@end_date)
    end

    if params[:tri] == "ressource"
      @utilisations = @utilisations.order(ressource_id: :asc, chantier_id: :asc)
    elsif params[:tri] == "chantier"
      @utilisations = @utilisations.order(chantier_id: :asc, ressource_id: :asc)
    elsif params[:tri] == "date de création"
      @utilisations = @utilisations.order(created_at: :desc)
    else params[:tri] == "date d'utilisation"
      @utilisations = @utilisations.order(date: :desc)
    end
    
    if turbo_frame_request?
      render partial: "utilisations", locals: { utilisations: @utilisations }
    else
      render :index
    end
    
  end

  def traiter
    @utilisation.toggle(:checked)
    @utilisation.save
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(@utilisation, partial: @utilisation, locals: { utilisation: @utilisation }) 
        ]
        
      end
    end
  end

  def trier
    @utilisations = Utilisation.all.order(ressource_id: :asc)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("utilisations", partial: "utilisations", locals: { utilisations: @utilisations }) 
        ]
      end
    end
  end

  def trier_par_ressources
    chantier = Chantier.find(params[:id])
    @utilisations = chantier.utilisations.all.order(ressource_id: :asc)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("utilisations", partial: "utilisations", locals: { utilisations: @utilisations }) 
        ]
      end
    end
  end

  # GET /utilisations/1 or /utilisations/1.json
  def show
  end

  # GET /utilisations/new
  def new
    @utilisation = Utilisation.new
  end

  # GET /utilisations/1/edit
  def edit
  end

  # POST /utilisations or /utilisations.json
  def create
    @utilisation = current_user.utilisations.new(utilisation_params)

    respond_to do |format|
      if @utilisation.save
        format.html { redirect_to chantier_url(@utilisation.chantier), notice: "Utilisation was successfully created." }
        format.json { render :show, status: :created, location: @utilisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @utilisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utilisations/1 or /utilisations/1.json
  def update
    respond_to do |format|
      if @utilisation.update(utilisation_params)
        format.html { redirect_to chantier_url(@utilisation.chantier), notice: "Utilisation was successfully updated." }
        format.json { render :show, status: :ok, location: @utilisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @utilisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utilisations/1 or /utilisations/1.json
  def destroy
    @utilisation.destroy

    respond_to do |format|
      format.html { redirect_to utilisations_url, notice: "Utilisation was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def ressources
    @target = params[:target]
    @ressources = Matiere.find_by_id(params[:matiere]).ressources.order(:epaisseur, :couleur)
    
    respond_to do |format|
      format.turbo_stream
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utilisation
      @utilisation = Utilisation.find(params[:id])
    end
    
    def set_ressources
      @ressources = Ressource.all.order(:matiere_id, :epaisseur, :couleur)
    end

    # Only allow a list of trusted parameters through.
    def utilisation_params
      params.require(:utilisation).permit(:user_id, :chantier_id, :machine_id, :ressource_id, :date, :quantite, :matiere_id, :checked)
    end
end
