class RentalsController < ApplicationController
    def index
        @customer = Customer.find(params[:customer_id])
        @rentals = @customer.rentals.where(rental_in: nil)
        
    end
    
    def new
     @rental = Rental.new
     
    end
   
    def create
        @rental = Rental.new(rental_params)
        @rental.customer_id = params[:customer_id]
        @rental.check_out
        
        redirect_to customer_path(@rental.customer)
    end

   def edit
    @rental = Rental.find_by_id(params[:id])
   end

   def update
    @rental = Rental.find_by(id: params[:id])
    if rental_params[:check_in] == "true"
        @rental.check_in
        binding.pry
        redirect_to customer_path(@rental.customer)
    end
   end


    private 
    def rental_params
       params.require(:rental).permit(:equipment_id, :rental_duration, :project_name, :customer_id, :check_in)
    end


end
