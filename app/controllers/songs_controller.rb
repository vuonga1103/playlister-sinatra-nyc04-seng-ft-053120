class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    song_name_slug = params[:slug]
    @song = Song.find_by_slug(song_name_slug)

    erb :'songs/show'
  end

  post '/songs' do
    song_name = params[:songs][:name]
    artist_name = params[:songs][:artist]
    artist = Artist.find_by(name: artist_name)

    if !artist
      artist = Artist.create(name: artist_name)
    end

    @song = Song.create(name: song_name, artist: artist)

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by(name: Song.find_by_slug(params[:slug]))

    song_name = params[:songs][:name]
    artist_name = params[:songs][:artist]
    artist = Artist.find_by(name: artist_name)

    if !artist
      artist = Artist.create(name: artist_name)
    end

    if !@song
      @song = Song.create(name: song_name, artist: artist)
    else
      @song.update(name: song_name, artist: artist)
    end

    redirect to "/songs/#{@song.slug}"
  end


end