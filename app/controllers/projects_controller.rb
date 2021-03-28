class ProjectsController < ApplicationController
    before_action :get_user
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        byebug
        @projects = Project.where("user_id = ?", params[:user_id])
    end

    def new
        @project = Project.new
        
    end

    def create
        
        
        @project = Project.new(project_params)
        if @project.save 
            redirect_to user_projects_path(current_user, @project)
        else 
            render :new
        end
    end

    def show
        @task = Task.new
    end
    
    
    

    private

    def project_params
        params.require(:project).permit(:name, :content)
    end

    def set_project
        @project = Project.find_by_id(params[:id])
    end

    
    def get_user
        @user = User.find_by_id(params[:user_id])
    end
    
    
end
