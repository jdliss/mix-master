class ArtistsController < ApplicationController
  def index
    render :index
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path(@artist.id)
    else
      render :edit
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_path
  end

private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
