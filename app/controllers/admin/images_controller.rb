
class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "You added a new image"
      redirect_to admin_images_path
    else
      render :new
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash[:success] = "#{image.name} was removed"

    redirect_to admin_images_path 
  end

  private

  def image_params
    params.require(:image).permit(:name, :image_path)
  end
end
