class Commande < ApplicationRecord

  validates :numero_de_commande, presence: true
  validates :numero_de_commande, uniqueness: { message: "existe déjà", case_sensitive: false }

  belongs_to :fournisseur
  belongs_to :user
  has_many :achats

  def ref_complete
    return "#{numero_de_commande} (#{fournisseur.nom} du #{date.strftime("%d/%m/%Y")})"
  end

  def ressources
    extraire_ressources(achats)
  end

  def chantiers
    extraire_chantiers(achats)
  end

  def quantite_commandee(ressource)
  end

  def complete?
    not achats.any?{|a| a.livre == false}
  end

  def status
    if complete?
      return "checked"
    else
      return "unchecked"
    end
  end




end
