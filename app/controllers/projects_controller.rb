class ProjectsController < ApplicationController
    before_action :set_project, only: [:show]

    def index
        @projects = @user.projects
    end

    def new
        @project = @user.projects.build
    end

    def create
        @project = @user.projects.build(project_params)

        respond_to do |format|
            if @project.save
                format.html { redirect_to user_projects_path, notice: 'Project was successfully created.'}
                format.json { render :show, status: created, location: @project}
            else
                format.html { render :new }
                format.json { render json: @project.errors, status: :unprocessable_entity}
            end
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
