class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to bird_path(@comment.bird), notice: 'Comment was successfully created.'
    else
      redirect_to bird_path(@comment.bird), notice: 'Unnable to comment.'
    end
  end

  def destroy
    bird = @comment.bird
    @comment.destroy
    redirect_to bird, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :bird_id, :user_id)
  end
end
