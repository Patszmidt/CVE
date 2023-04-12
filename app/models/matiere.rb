class Matiere < ApplicationRecord
  has_many :ressources

  validates :nom, presence: true
  validates :nom, uniqueness: { message: "existe déjà", case_sensitive: false }


end
