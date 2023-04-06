class Commande < ApplicationRecord

  validates :numero_de_commande, presence: true

  belongs_to :fournisseur
  has_many :achats

  def ref_complete
    return "#{numero_de_commande} (#{fournisseur.nom} du #{date.strftime("%d/%m/%Y")})"
  end

  def ressources
    ressources = []
    extraire_ressources(achats, ressources)
  end

  def chantiers
    chantiers = []
    extraire_chantiers(achats, chantiers)
  end

  def quantite_commandee(ressource)
  end


end
