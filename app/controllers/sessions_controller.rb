class SessionsController < ApplicationController
    def new
        @user = User.new
       end
       
       def create
         @user = User.find_by(email: params[:user][:email])
         if @user.nil?
            redirect_to new_user_path
         elsif @user.authenticate(params[:user][:password])
           session[:user_id] = @user.id
              redirect_to @user
         end
       end
       
       def destroy
       
         session.delete :user_id
         redirect_to root_url
       end
     


end
