class CommandesController < ApplicationController
  before_action :set_commande, only: %i[ show edit update destroy livrer details]

  # GET /commandes or /commandes.json
  def index
    @commandes = Commande.all.order(date: :desc)
  end

  def list
    @commandes = Commande.all
    @commandes = @commandes.where('numero_de_commande ilike ?', "%#{params[:numero_de_commande]}%") if params[:numero_de_commande].present?
    @commandes = @commandes.order("#{params[:column]} #{params[:direction]}")
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace('commandes', partial: 'commandes', locals: { commandes: @commandes }) 
        ]
      end
    end
  end

  def details
    respond_to do |format|
      format.turbo_stream
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

  def livrer
    @commande.toggle(:livree)
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

  # POST /commandes or /commandes.json
  def create
    @commande = current_user.commandes.new(commande_params)

    respond_to do |format|
      if @commande.save
        format.html { redirect_to commande_url(@commande), notice: "Commande was successfully created." }
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
        format.html { redirect_to commande_url(@commande), notice: "Commande was successfully updated." }
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

    # Only allow a list of trusted parameters through.
    def commande_params
      params.require(:commande).permit(:date, :fournisseur_id, :numero_de_commande, :livree, :user_id, :column)
    end
end
