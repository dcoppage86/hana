class CommentsController < ApplicationController
    before_action :login_required

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(params[:subject])
        if @comment.save
          redirect_to project_comments_path(@comment)
        else
          render 'new'
        end
    end

    def show
    
    end
    
    private

    # def comment_params
    #     params.require(:comment).require(:subject, :content)
    # end
    
    
end
