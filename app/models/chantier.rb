class Chantier < ApplicationRecord
  
  belongs_to :client
  has_many :utilisations
  
   
  def nom_complet
    return "#{self.nom} (#{self.client.nom})"
  end
  
end
