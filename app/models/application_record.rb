class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def extraire_ressources(collection)
    collection.map{|c| c.ressource}.uniq.sort_by{|r| r.id}
  end

  def extraire_chantiers(collection)
    collection.map{|c| c.chantier}.uniq
  end

  def quantite_utilisee(ressource)
    utilisations.where(ressource: ressource).sum{|u| u.quantite}
  end

  def quantite_achetee(ressource)
    achats.where(ressource: ressource).sum{|u| u.quantite}
  end


end
