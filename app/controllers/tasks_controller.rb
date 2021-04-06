class TasksController < ApplicationController
    
    before_action :set_project, only: [:new]
    before_action :set_task, only: [:edit, :update]
    

    def index
        @tasks = Task.all
    end

    def new
        @tasks = @project.tasks.new
        if params[:user_id]
            @user = User.find(params[:user_id])
            @task = Task.new([user_id: @user.id, project_id: @project.id])
        else
            @user = nil 
            @task = Task.new
        end
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

    def update 
        if @task.update(task_params)
            redirect_to projects_path
        else
            render :edit
        end
    end

    def complete
        @tasks = Task.all
        @task.completed_tasks
        # redirect_to projects_path
    end
    
    

    private 

    def set_task
        @task = Task.find_by_id(params[:id])
    end

    def set_project
        @project = Project.find(params[:project_id])
    end

    def task_params
        params.require(:task).permit(:name, :completed, :user_id, :project_id)
    end
    
    
    
end
