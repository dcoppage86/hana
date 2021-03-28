class TasksController < ApplicationController
    before_action :login_required
    before_action :get_user only: [:new]

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

    def new
        @task = Task.new(user_id: @user.id)
    end

    def create 
        @task = Task.new(task_params)
        if @task.save 
            redirect_to projects_path
        else 
            render :new
        end
    end
    
    def edit
        
    end
    

    private 
    
    
    def get_user
        @user = User.find(params[:user_id])
    end

    def task_params
        params.require(:task).permit(:name, :completed, :user_id, :project_id)
    end
    
    
    
end
