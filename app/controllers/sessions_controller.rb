class SessionsController < ApplicationController
    # skip_before_action :login_required, :only => [:home, :new, :create]
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

    private
    
    def login(user)
        session[:user_id] = nil
    end
    
    
end
