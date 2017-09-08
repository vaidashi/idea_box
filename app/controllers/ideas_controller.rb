class IdeasController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new(params[:id])
    # @category = Category.new
    @categories = Category.order(:name)
  end

  def create
    # @category = Category.all
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


  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end
end
