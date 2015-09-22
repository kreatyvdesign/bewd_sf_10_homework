class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(article_params)

    if @artist.save
      redirect_to artists_path
    else
      render 'new'
    end
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(article_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  private
    def article_params
      params.require(:artist).permit(:name, :image_url, :description)
    end
end
