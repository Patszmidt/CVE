class Utilisateur < ApplicationRecord
  
  has_many :utilisations
  has_many :achats
  
  def nom_complet
    return "#{self.prenom} #{self.nom}"
  end
  
end
