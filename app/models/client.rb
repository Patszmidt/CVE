class Client < ApplicationRecord

	has_many :chantiers
	validates :nom, presence: true
	validates :nom, uniqueness: { message: "existe déjà", case_sensitive: false }

end
