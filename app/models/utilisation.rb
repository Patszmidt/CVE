class Utilisation < ApplicationRecord

  belongs_to :user
  belongs_to :chantier
  belongs_to :machine
  belongs_to :ressource
  
  attr_accessor :origines
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
    if checked
      return "checked"
    else
      return "unchecked"
    end
  end
  
end
