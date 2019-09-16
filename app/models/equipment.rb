class Equipment < ApplicationRecord
    belongs_to :company
    has_many :rentals
    has_many :customers, through: :rentals

   def self.eq_rented
       Equipment.where(rented: true)
   end


end
