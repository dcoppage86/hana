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
        @project = Project.new
        
    end

    def create
        
        @project = Project.new(params[:name])
        if @project.save 
            redirect_to project_path(@project)
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
