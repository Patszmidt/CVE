class Chantier < ApplicationRecord
  
  belongs_to :client
  has_many :utilisations
  has_many :achats
  
   
  def nom_complet
    return "#{self.nom} (#{self.client.nom})"
  end

  def ressources
    ressources = []
    ressources = extraire_ressources(utilisations, ressources)
    ressources = extraire_ressources(achats, ressources)
  end

  def equilibre?
    scale = 0
    self.ressources.uniq.each do |ressource|
      balance = self.quantite_achetee(ressource)-self.quantite_utilisee(ressource)
      if balance >= 0
        scale += 0
      else
        scale +=1
      end
    end
    if scale > 0
      return false
    else
      return true
    end
  end
  
end
