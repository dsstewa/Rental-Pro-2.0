class Rental < ApplicationRecord
    belongs_to :customer
    belongs_to :equipment
    
    def check_out
        self.rental_out = Time.now
        @equipment = Equipment.find(self.equipment_id)
        @equipment.rented = true
        @equipment.save
        self.save
    end
   
    def check_in
        self.rental_in = Time.now
        @equipment = Equipment.find(self.equipment_id)
        @equipment.rented = false
        @equipment.save
        self.save
    end

end
