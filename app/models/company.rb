class Company < ApplicationRecord

    has_many :extinguishers
    #has_many :controls

    #validation
    validates_presence_of :id
    validates_presence_of :name
    validates_presence_of :address

end
