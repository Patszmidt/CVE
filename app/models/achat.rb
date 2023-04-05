class Achat < ApplicationRecord
  belongs_to :user
  belongs_to :chantier
  belongs_to :ressource
  # belongs_to :commande

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

  def self.create_from(utilisation)
    c = Achat.new
    c.chantier = utilisation.chantier
    c.ressource = utilisation.ressource
    c.quantite = utilisation.quantite
    c.date_de_achat = Date.today
    c.livre = false
    c.save
  end

end
