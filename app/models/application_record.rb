class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def extraire_ressources(collection, contenant)
    collection.each do |c|
      contenant << c.ressource
    end
    contenant.uniq.sort_by{|r| r.id}
  end

  def extraire_chantiers(collection, contenant)
    collection.each do |c|
      contenant << c.chantier
    end
    contenant.uniq
  end

  def quantite_utilisee(ressource)
    qte = 0
    self.utilisations.where(ressource: ressource).each do |u|
      qte += u.quantite
    end
    return qte
  end

  def quantite_achetee(ressource)
    qte = 0
    self.achats.where(ressource: ressource).each do |u|
      qte += u.quantite
    end
    return qte
  end


end
