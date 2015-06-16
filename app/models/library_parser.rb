class LibraryParser
  "./db/data"

  attr_accessor :path

  def initialize # I thought we are supposed to initialize it with a directory?!
    @path = path
  end
  # return all the filenames within the target directory.

  def files
    Dir["./db/data/*"]
  end

  #  actually parse all the file names and create corresponding instances.
  # Given a filename, this should separate it out to the corresponding data points of an artist, a song, and a genre.
  # Action Bronson - Larry Csonka [indie].mp3
  def parse_filename(filename)
    filename.gsub(" - ","/").gsub(" [","/").gsub("].mp3","").split("/") # returns a three-part array of artist, song, and genre
  end

  # Given an artist name, a song name, and a genre name, this method will build the corresponding 
  # object instances of Artist, Song, and Genre.
  def build_song(artist, song, genre)
    new_song = Song.create_by_name(song)
    new_artist = Artist.create_by_name(artist)
    new_genre = Genre.create_by_name(genre)
    new_song.genre = new_genre
    new_song.artist = new_artist
    new_song
  end

  def call
    files.each do |filename|
      x = parse_filename(filename)
      build_song(x[0],x[1],x[2])
    end
  end

end

=begin
  
The LibraryParser should responsible for finding the MP3 files, 
parsing their titles, and build Song, Artist, and Genre objects from that data.
=end