class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        if params[:user_id]
            @projects = User.find(params[:user_id]).projects
        else
            @projects = Project.all
        end
    end

    def new
        byebug
        @project = Project.new
        
    end

    def create
        
        @project = Project.new(params[:name, :content])
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
