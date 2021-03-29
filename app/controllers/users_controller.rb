class UsersController < ApplicationController
    
    def new
      if logged_in?
        redirect_to projects_path
      else
        @user = User.new
        render layout: 'sessions'
      end
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_tasks_path(current_user, @tasks)
        else
          render :new
        end
    end

  
    

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
