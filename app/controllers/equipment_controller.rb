class EquipmentController < ApplicationController
   
  before_action :set_equipment, only: [:show, :edit, :update]
   
  def new
        @equipment = Equipment.new
      end
    
      def create
        @equipment = Equipment.new(equipment_params)
        @equipment.save
        redirect_to equipment_index_path
      end
    
    
      def index
        if !params[:search]
        @equipment = Equipment.all
        else
        @equipment = Equipment.where("name like ?", "%#{params[:search]}%")
         
        end

      end
      
      def show
        
      end


      def edit
       
      end
    

       def update
        @equipment.update(equipment_params)
        if @equipment.save
            redirect_to equipment_path(@equipment)
        end 
    
        end

      private 
      
      def set_equipment
        @equipment = Equipment.find_by(id: params[:id])
      end
       
      def equipment_params
         params.require(:equipment).permit(:name, :rental_company, :rental_company, :make, :machine_type, :rental_rate_day, :project_id, :company_id)
      end



end
