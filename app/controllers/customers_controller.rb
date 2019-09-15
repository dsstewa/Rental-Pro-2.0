class CustomersController < ApplicationController
    def new
        @customer = Customer.new
    
    end
    
    def create
        @customer = Customer.new(customer_params)
        @customer.save
        redirect_to customers_path
    end
    
    def index
        @customers = Customer.where(company_id: current_user.company_id)
    end

    def show
        @customer = Customer.find_by_id(params[:id])
    end

    private 
    def customer_params
       params.require(:customer).permit(:name, :phone_number, :phone_number, :address, :company_id)
    end

end
