class Artist

  attr_accessor :name, :songs, :genres, :artist_name, :songs_array

  @@artists = Array.new

  def initialize
    @songs = Array.new
    @genres = Array.new
    @@artists << self
  end

  def add_song(song)
    @songs << song # update genres along with a song
    if song.genre      
      @genres << song.genre # push genres of the song array into the genres array
      song.genre.add_artist(self)
    end
  end 

  def add_songs(songs_array) # multiple songs at once
    songs_array.each do |song| # iterate over an array and call add_song on each individual one
      add_song(song)
    end
  end 

  # class methods
  def self.all
    @@artists
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def self.find_by_name(artist_name)
    self.all.find do |artist|
      artist.name == artist_name
    end
  end

  def self.create_by_name(name)
    artist = self.new
    artist.name = name
    artist
  end

end