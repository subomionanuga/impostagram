class PicturesController < ApplicationController

  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to @picture, notice: "Picture succesfully posted"
    else
      render 'new'
    end
  end

  def show
    find_picture
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :description)
  end

  def find_picture
    @picture = Picture.find(params[:id])
  end

end
