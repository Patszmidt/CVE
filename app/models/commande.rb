class Commande < ApplicationRecord
  belongs_to :utilisateur
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

end
