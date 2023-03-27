class Utilisateur < ApplicationRecord
  
  has_many :utilisations
  
  def nom_complet
    return "#{self.prenom} #{self.nom}"
  end
  
end
