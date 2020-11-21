class CompanySerializer < ActiveModel::Serializer
  
  attributes :id, :name #:created_at, :updated_at
  #has_many :fire_extinguishers

end
