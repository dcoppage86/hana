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
        @comment = Comment.new(comment_params)
        @comment.save
        redirect_to comments_path
       
    end

    def show
    
    end
    
    private

    def comment_params
        params.require(:comment).permit(:subject, :content)
    end

    def get_project
        @project = Project.find_by_id(params[:project_id])
    end



    
    
end
