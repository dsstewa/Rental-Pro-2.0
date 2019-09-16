class CompaniesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
      def new
        @company = Company.new
      end
    
      def create
        @company = Company.new(company_params)
        @company.save
        redirect_to root_path
       
    
      end
    
      private 
      
      def company_params
         params.require(:company).permit(:name, :phone_number, :address)
      end

end
