class Extinguisher < ApplicationRecord
  
  belongs_to :company
  has_many :controls

  #validation
  validates_presence_of :matricola
  validates_presence_of :company_id


end
