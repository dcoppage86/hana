class TasksController < ApplicationController
    before_action :login_required

    def index
        if params[:user_id]
            if User.find(params[:user_id]) == current_user
                @user = User.find(params[:user_id])
                @tasks = @user.tasks 
            else 
                redirect_to projects_path
                flash[:notice] = "You do not have access to this."
            end
        else
            @tasks = Task.all
        end
    end
    
end
