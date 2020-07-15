adele = Artist.create(name: "Adele")
song1 = Song.create(name: "rolling in the deep", artist: adele)
genre1 = Genre.create(name: "contemporary")

song_genre1 = SongGenre.create(song: song1, genre: genre1)