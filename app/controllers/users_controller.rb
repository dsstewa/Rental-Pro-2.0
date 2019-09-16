class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        @company = Company.find_by_id(user_params[:company_id])
        @user.company = @company
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path current_user
      
    end

    def show
        @user = User.find_by_id(params[:id])
    end
    
    def edit
        @user = User.find_by_id(params[:id])
    end
  




    def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.save
        redirect_to user_path(@user)
    end 

    end



       private 
    def user_params
       params.require(:user).permit(:name, :password, :phone_number, :email, :password_confirmation, :company_id)
    end





end
