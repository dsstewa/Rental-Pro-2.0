module RentalsHelper
    def rental_check_in_link(equipment)
        @rental = equipment.rentals.find_by(rental_in: nil)
        edit_customer_rental_path(@rental)
    end
end
