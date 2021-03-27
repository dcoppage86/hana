class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        if params[:user_id]
            @projects = User.find(params[:user_id]).projects
        else
            @projects = Projects.all
        end
    end

    def new
        @project = @user.project.new
        
    end

    def create
        
        @project = @user.project.new(params[:name, :content])
        if @project.save 
            redirect_to user_project_path(@project)
        else 
            render :new
        end
    end

    def show
        @task = Task.new
    end
    
    
    

    private

    def set_project
        @project = Project.find_by_id(params[:id])
    end

    
    
    
    
end
