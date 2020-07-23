class BirdsController < ApplicationController
  before_action :set_bird, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @birds = Bird.all
  end

  def show; end

  def new
    @bird = Bird.new
  end
  
  def edit; end
  
  def create
    @bird = Bird.new(bird_params)
    @bird.user = current_user

    respond_to do |format|
      if @bird.save
        format.html { redirect_to @bird, notice: 'Bird was successfully created.' }
        format.json { render :show, status: :created, location: @bird }
      else
        format.html { render :new }
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @bird.update(bird_params)
        format.html { redirect_to @bird, notice: 'Bird was successfully updated.' }
        format.json { render :show, status: :ok, location: @bird }
      else
        format.html { render :edit }
        format.json { render json: @bird.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bird.destroy
    respond_to do |format|
      format.html { redirect_to birds_url, notice: 'Bird was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bird
    @bird = Bird.find(params[:id])
  end

  def bird_params
    params.require(:bird).permit(:body)
  end
end
