class Machine < ApplicationRecord
  
  has_many :utilisations
  validates :nom, uniqueness: { message: "existe déjà", case_sensitive: false }
  validates :nom, presence: true
  
end
