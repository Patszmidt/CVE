class Ressource < ApplicationRecord
  belongs_to :matiere
  has_many :utilisations
  has_many :achats
  
  def nom_complet
    return "#{self.matiere.nom} #{self.epaisseur}mm #{self.dimension} #{self.couleur} #{self.qualite}"
  end
  
  def quantite_utilisee
    utilisations.sum{|u| u.quantite}
  end

  def quantite_achetee
    achats.sum{|u| u.quantite}
  end

  def chantiers
    extraire_chantiers(achats + utilisations)
  end
  
end
