class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @songs = Song.find(params[:id])
  end

  def new
    @songs = Song.new
  end

  def edit
    @songs = Song.find(params[:id])
  end

  def create
    @songs = Songs.new(article_params)

    if @song.save
      redirect_to @song
    else
      render 'new'
    end
  end

  def update
    @song = Song.find(params[:id])

    if @song.update(article_params)
      redirect_to @song
    else
      render 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to songs_path
  end

  private
    def article_params
      params.require(:song).permit(:title, :length, :genre)
    end
end
