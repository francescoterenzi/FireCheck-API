class Extinguisher < ApplicationRecord
  
  belongs_to :company
  has_many :controls

  #validation
  validates_presence_of :id
  validates_presence_of :weight
  validates_presence_of :typology

end
