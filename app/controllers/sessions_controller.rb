class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :omniauth
    
    def home
        if logged_in?
            redirect_to projects_path
            flash[:notice] = "You are already logged in."
        end
    end

    def new
        @user = User.new
    end

    def create
        
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to projects_path
        else
            flash.now.alert = "Invalid email or password"
            render "new"
        end
    end

    def destroy
        session[:user_id] = nil 
        redirect_to root_path
    end

    def omniauth
         
        @user = User.find_or_create_by(uid: auth["uid"], email: auth["info"]["email"]) do |u|
            u.password = SecureRandom.hex(16)
        end
        

        if @user && @user.id
            session[:user_id] = @user.id 
            redirect_to projects_path
        else
            redirect_to login_path
        end
    end

    private
    
    def login(user)
        session[:user_id] = nil
    end

    def auth
        request.env['omniauth.auth']
    end
    
    
end
