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
    
    if @bird.save
      redirect_to @bird, notice: 'Bird was successfully created.'
    else
      redirect_to @bird, notice: 'Unnable to create bird.'
    end
  end
  
  def update
    if @bird.update(bird_params)
      render :show, status: :ok, location: @bird
    else
      render :edit
    end
  end

  def destroy
    @bird.destroy
    redirect_to birds_url, notice: 'Bird was successfully deleted.'
  end

  private

  def set_bird
    @bird = Bird.find(params[:id])
  end

  def bird_params
    params.require(:bird).permit(:body)
  end
end
