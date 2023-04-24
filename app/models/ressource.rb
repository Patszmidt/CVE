class Ressource < ApplicationRecord
  belongs_to :matiere
  has_many :utilisations
  has_many :achats
  
  def nom_complet
    return "#{self.matiere.nom} #{self.epaisseur}mm #{self.forme} #{self.dimension} #{self.couleur} #{self.qualite}"
  end
  
  def quantite_utilisee
    utilisations.sum{|u| u.quantite}
  end

  def quantite_achetee
    achats.sum{|u| u.quantite}
  end

  def chantiers
    extraire_chantiers(achats + utilisations)
  end

  def self.a_acheter
    a_acheter = []
    Ressource.all.each do |r|
      if r.quantite_utilisee > r.quantite_achetee
        a_acheter << r
      end
    end
    return a_acheter
  end
  
end
