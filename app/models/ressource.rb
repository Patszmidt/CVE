class Ressource < ApplicationRecord
  belongs_to :matiere
  has_many :utilisations
  has_many :achats
  
  def nom_complet
    return "#{self.matiere.nom} #{self.epaisseur}mm #{self.couleur} #{self.qualite}"
  end
  
  def quantite_utilisee
    qte = 0
    self.utilisations.each do |u|
      qte += u.quantite
    end
    return qte
  end
  
end
