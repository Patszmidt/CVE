class Commande < ApplicationRecord
  belongs_to :user
  belongs_to :chantier
  belongs_to :ressource

  attribute :matiere
  attribute :matiere_id
  
  def matiere
    if self.ressource
      self.ressource.matiere
    end
  end
  
  def matiere_id
    if self.ressource
      self.ressource.matiere.id
    end
  end

  def status
    if livre
      return "checked"
    else
      return "unchecked"
    end
  end

  def self.create_from_utilisation(utilisation)
    c = Commande.new
    c.chantier = utilisation.chantier
    c.ressource = utilisation.ressource
    c.quantite = utilisation.quantite
    c.date_de_commande = Date.today
    c.user = utilisation.user
    c.save
  end

end
