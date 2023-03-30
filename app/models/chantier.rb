class Chantier < ApplicationRecord
  
  belongs_to :client
  has_many :utilisations
  has_many :commandes
  
   
  def nom_complet
    return "#{self.nom} (#{self.client.nom})"
  end
  
end
