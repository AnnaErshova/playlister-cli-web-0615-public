class Genre

  attr_accessor :name, :songs, :genres, :genre_name, :artists

  @@genres = Array.new

  def initialize
    @songs = Array.new
    @artists = Array.new
    @@genres << self
  end

  def add_song(song)
    @songs << song
  end

  def add_artist(artist)
    @artists << artist
  end

  def artists
    @artists.uniq 
  end

  # class methods
  def self.all
    @@genres
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def self.find_by_name(genre_name)
    self.all.find do |genre|
      genre.name == genre_name
    end
  end

  def self.create_by_name(name)
    genre = self.new
    genre.name = name
    genre
  end

end
