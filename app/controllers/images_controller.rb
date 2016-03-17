class ImagesController < ApplicationController

  def index
    @images = current_user.images.reverse_order
  end

  def show
    begin
      img = Image.find(params[:id])
    rescue => error
      @errors = generate_errors(Image, { image: error.message })

      render 'base/errors', status: 404
      return
    end

    send_file img.resize.path
  end

  def create
    img = current_user.images.new(image_params)

    if img.valid?
      file = img.resize

      img.width = file[:width]
      img.height = file[:height]
      img.save

      send_file file.path
    else
      @errors = img.errors
      render 'base/errors', status: 422
    end
  end

  private
    def image_params
      params.require(:image)
        .permit(
          :height,
          :width,
          :picture
        )
    end

end
