class Ressource < ApplicationRecord
  belongs_to :matiere
  has_many :utilisations
  has_many :commandes
  
  def nom_complet
    return "#{self.matiere.nom} #{self.epaisseur}mm #{self.couleur} #{self.qualite}"
  end  
  
end
