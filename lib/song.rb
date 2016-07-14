require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # self
  end

  def self.create
    # self.new.save
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end



  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)

    @@all.detect {|song| song.name==name} || self.create_by_name(name)

    # artist ? artist : self.create_by_name(name)

  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(name)
    song = self.new
    songInfo = name.gsub((/(\s-\s)|(\.mp3)/),"-").split("-")
    song.artist_name, song.name = songInfo[0], songInfo[1]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    songInfo = name.gsub((/(\s-\s)|(\.mp3)/),"-").split("-")
    song.artist_name, song.name = songInfo[0], songInfo[1]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
end
