class CommentsController < ApplicationController
    skip_forgery_protection

    def index 
        comment = Comment.all
        render json: comment, status: :ok
    end

    def create
        comment = Comment.create(comment_params)
        render json: comment, status: :created
    end

    def show
        comment = find_comment
        render json: comment
    end

    def update
        comment = find_article
        comment.update(comment_params)
        render json: comment, status: :ok
    end

    def destroy
        comment = find_comment
        comment.destroy
        head :no_content
    end

    private

    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

    def find_comment
        Comment.find(params[:id])
    end
end
