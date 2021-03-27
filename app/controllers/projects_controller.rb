class ProjectsController < ApplicationController
    before_action :set_project, only: [:show]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
        @project.tasks.build
    end

    def create
        @project = Project.new(project_params)
        if @project.save 
            redirect_to @project
        else 
            render :new
        end
    end

    def show
        
    end
    
    
    

    private

    def project_params
        params.require(:project).permit(:name)
    end

    def set_project
        @project = Project.find_by_id(params[:id])
    end
    
    
    
end
