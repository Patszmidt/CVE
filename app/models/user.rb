class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


  has_many :utilisations
  has_many :achats
  has_many :commandes
  
  def nom_complet
    return "#{self.prenom} #{self.nom}"
  end

end
