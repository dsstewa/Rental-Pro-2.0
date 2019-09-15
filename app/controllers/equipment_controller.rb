class EquipmentController < ApplicationController
    def new
        @equipment = Equipment.new
      end
    
      def create
        @equipment = Equipment.new(equipment_params)
        @equipment.save
        redirect_to equipment_index_path
      end
    
    
      def index
        @equipment = Equipment.all
      end
      
      def show
        @equipment = Equipment.find_by_id(params[:id])
      end


      def edit
        @equipment = Equipment.find_by_id(params[:id])
      end
    

       def update
        @equipment = User.find_by(id: params[:id])
        @equipment.update(equipment_params)
        if @equipment.save
            redirect_to equipment_path(@equipment)
        end 
    
        end




      private 
      def equipment_params
         params.require(:equipment).permit(:name, :rental_company, :rental_company, :make, :machine_type, :rental_rate_day, :project_id, :company_id)
      end



end
