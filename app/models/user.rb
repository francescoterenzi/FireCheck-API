class User < ApplicationRecord
    has_many :controls

    validates_presence_of :id
    validates_presence_of :first_name
    validates_presence_of :last_name
end
