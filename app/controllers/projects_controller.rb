class ProjectsController < ApplicationController
    before_action :require_login
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
            
    end

    def new
        @project = Project.new
        
    end

    def create
        @project = Project.new(project_params)
        if @project.save 
            redirect_to user_project_path(current_user, @project)
        else 
            render :new
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
        if @project.update_attributes(project_params)
          redirect_to user_project_path(current_user, @project)
        else
          render 'edit'
        end
    end
    
    
    
    
    

    private

    def project_params
        params.require(:project).permit(:name, :content)
    end

    def set_project
        @project = Project.find_by_id(params[:id])
    end

end
