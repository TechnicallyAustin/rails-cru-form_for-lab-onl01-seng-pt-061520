class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])        
    end

    def new
        #this should render a new form
        @song = Song.new
    end

    def create 
        #this should create the record in the DB
        @song = Song.create(song_params)
        redirect_to song_path(@song)
    end

    def update
        #this is the actual DB change
        @song = Song.find(params[:id])
        @song.update(song_params)
        redirect_to song_path(@song)
    end

    def edit
        @song = Song.find(params[:id])
    end

    def delete
        @song = Song.find(params[:id])
        @song.delete
    end

    private

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

    
end
