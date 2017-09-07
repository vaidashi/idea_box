class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:message] = "Category #{@category.name} was created!"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = "#{category.name} was successfully deleted!"

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
