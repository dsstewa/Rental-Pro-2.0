module RentalsHelper
    def rental_check_in_link(equipment)
        @rental = equipment.rentals.find_by(rental_in: nil)
        edit_customer_rental_path(@rental)
    end
    
    def current_rentals(customer)
        @current_rentals = customer.rentals.where(check_in: nil)
    end

    
end
