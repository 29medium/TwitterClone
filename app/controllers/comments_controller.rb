class CommentsController < ApplicationController
  def create
    @bird = Bird.find(params[:bird_id])

    @comment = @bird.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
        if @bird.save
          format.html { redirect_to bird_path(@bird), notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @bird }
        else
          format.html { render :new }
          format.json { render json: @bird.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @bird, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
