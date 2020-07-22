class CommentsController < ApplicationController
    def create
        # Get Bird comment is attached to
        @bird = Bird.find(params[:bird_id])

        # Create and save comment
        @comment = @bird.comments.new(comment_params)
        @comment.user = current_user
        
        # Go to the bird this comment is associated with
        redirect_to bird_path(@bird)
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
