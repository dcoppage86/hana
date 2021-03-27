class ProjectsController < ApplicationController
    before_action :get_user
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = @user.projects
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

    def get_user
        @user = User.find(params[:user_id])
    end
    
    
    
end
