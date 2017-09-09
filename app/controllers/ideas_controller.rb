class IdeasController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new(params[:id])
    @categories = Category.order(:name)
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "You successfully added your new idea"
      redirect_to user_path(@user)
    else
      flash[:notice] = "You must enter in all fields"
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:notice] = "Successful update for #{@idea.title}"
      redirect_to user_idea_path(@idea.user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
      flash[:notice] = "You've successfully deleted your idea!"
      redirect_to user_path(@idea.user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, image_ids: [])
  end
end
