class ProjectsController < ApplicationController
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
            redirect_to project_path(@project)
        else 
            render :new
        end
    end

    def show
        
        @tasks = @project.tasks
    end

    def edit
        
    end

    def update
        if @project.update_attributes(project_params)
          redirect_to projects_path
        else
          render 'edit'
        end
    end

    def destroy
    
       @project.destroy
       redirect_to projects_path
    end
   
    
    
    private

    def project_params
        params.require(:project).permit(:name, :content)
    end

    def set_project
        @project = Project.find_by_id(params[:id])
    end

end
