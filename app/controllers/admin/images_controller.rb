
class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all 
  end

end
