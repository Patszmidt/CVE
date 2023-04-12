class Fournisseur < ApplicationRecord

    has_many :commandes
    validates :nom, uniqueness: { message: "existe déjà", case_sensitive: false }
    validates :nom, presence: true

end
