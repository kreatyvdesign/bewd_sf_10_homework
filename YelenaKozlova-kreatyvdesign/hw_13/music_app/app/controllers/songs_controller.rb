class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.update(song_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private
    def song_params
      params.require(:song).permit(:title, :length, :genre)
    end
end
