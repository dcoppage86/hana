class CommentsController < ApplicationController
    before_action :login_required
    before_action :get_project

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save 
            redirect_to project_path(@comment.project)
        else 
            redirect_to project_path(@comment.project)
        end
    end

    def show
        @comments = @project.comments
    end

    def destroy 
        @comment.destroy
        redirect_to projects_path
    end
    private

    def comment_params
        params.require(:comment).permit(:subject, :content, :user_id, :project_id)
    end

    def get_project
        @project = Project.find_by_id(params[:project_id])
    end



    
    
end
