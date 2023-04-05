class Commande < ApplicationRecord

  validates :numero_de_commande, presence: true

  belongs_to :fournisseur
  has_many :achats

end
