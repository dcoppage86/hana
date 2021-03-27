class ProjectsController < ApplicationController
    before_action :get_user
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def new
        @project = @user.projects.build
        
    end

    def create
        
        @project = Project.new(params[:name])
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
        @user = User.find_by_id(params[:id])
    end
    
    
    
end
