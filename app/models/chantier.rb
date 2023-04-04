class Chantier < ApplicationRecord
  
  belongs_to :client
  has_many :utilisations
  has_many :ressources, through: :utilisations
  has_many :commandes
  
   
  def nom_complet
    return "#{self.nom} (#{self.client.nom})"
  end

  def quantite_utilisee(ressource)
    qte = 0
    self.utilisations.where(ressource: ressource).each do |u|
      qte += u.quantite
    end
    return qte
  end

  def quantite_commandee(ressource)
    qte = 0
    self.commandes.where(ressource: ressource).each do |u|
      qte += u.quantite
    end
    return qte
  end

  def equilibre?
    scale = 0
    self.ressources.uniq.each do |ressource|
      balance = self.quantite_commandee(ressource)-self.quantite_utilisee(ressource)
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
