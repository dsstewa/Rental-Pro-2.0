class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :gitcreate]
  
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

       def gitcreate
           
        @user = User.find_by(uid: auth['uid'])
        if @user
          session[:user_id] = @user.id
          redirect_to @user
        else
         @user = User.new(uid: auth['uid'], name: auth['info']['name'], email: auth['info']['email'], password: auth['uid'])
         @user.company_id = "1"
         @user.save
         session[:user_id] = @user.id
         redirect_to @user
        end
      end
       
        def destroy
         session.delete :user_id
         redirect_to root_url
        end

       def auth
        request.env['omniauth.auth']
       end


end
