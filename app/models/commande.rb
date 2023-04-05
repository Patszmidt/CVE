class Commande < ApplicationRecord

  validates :numero_de_commande, presence: true

  belongs_to :fournisseur
  has_many :achats

  def ref_complete
    return "#{numero_de_commande} (#{fournisseur.nom} du #{date.strftime("%d/%m/%Y")})"
  end


end
