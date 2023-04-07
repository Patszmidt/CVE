class Chantier < ApplicationRecord
  
  belongs_to :client
  has_many :utilisations
  has_many :achats
  
   
  def nom_complet
    return "#{self.nom} (#{self.client.nom})"
  end

  def utilisations_virtuelles
    utilisations_virtuelles = []
      self.ressources_utilisees.each do |r|
        qte = 0
        utilisation_virtuelle = Utilisation.new
        utilisation_virtuelle.origines = []
        utilisations.select{|u| u.ressource_id == r.id}.each do |u|
          qte += u.quantite
          utilisation_virtuelle.origines << u.id
        end
        achats.select{|a| a.ressource_id == r.id}.each do |a|
          qte -= a.quantite
        end
        utilisation_virtuelle.ressource = r
        utilisation_virtuelle.date = Date.today
        utilisation_virtuelle.machine = Machine.first
        utilisation_virtuelle.quantite = qte
        utilisation_virtuelle.chantier = self
        utilisations_virtuelles << utilisation_virtuelle
        return utilisations_virtuelles
      end
    end

  def ressources
    (ressources_utilisees + ressources_achetees).uniq
  end

  def ressources_utilisees
    ressources = []
    ressources = extraire_ressources(utilisations, ressources)
  end

  def ressources_achetees
    ressources = []
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
