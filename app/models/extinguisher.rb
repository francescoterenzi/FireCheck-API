class Extinguisher < ApplicationRecord
  
  #model association
  has_one :company
  has_many :controls

  #validation
  validates_presence_of :matricola

end
