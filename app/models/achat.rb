class Achat < ApplicationRecord
  belongs_to :user
  belongs_to :chantier
  belongs_to :ressource
  belongs_to :commande

  attribute :matiere
  attribute :matiere_id

  validates :quantite, presence: true
  
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

  def date
    commande.date
  end

  def self.create_from(utilisation, commande)
    achat = Achat.new
    achat.chantier = utilisation.chantier
    achat.ressource = utilisation.ressource
    achat.quantite = utilisation.quantite
    achat.livre = false
    commande.achats << achat
  end

end
