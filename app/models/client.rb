class Client < ApplicationRecord

	has_many :chantiers
	validates :nom, presence: true
	validates :nom, uniqueness: { message: "existe déjà", case_sensitive: false }

	def chantiers_actifs
		chantiers.where(cloture: false)
	end

	def chantiers_clotures
		chantiers.where(cloture: true)
	end

end
