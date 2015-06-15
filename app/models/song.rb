class Song

  attr_accessor :name, :genre, :artist, :song_name

  @@songs = Array.new

  def initialize
    @@songs << self
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  # class methods
  def self.all
    @@songs 
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song
  end

end