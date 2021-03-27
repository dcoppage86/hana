class ApplicationController < ActionController::Base
    
    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
            @current_user
        else
            false
        end
    end

    def logged_in?
        !current_user.nil?
    end

    helper_method :current_user

end
