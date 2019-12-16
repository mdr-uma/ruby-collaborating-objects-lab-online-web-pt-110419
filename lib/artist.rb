require 'pry'
class Artist

    attr_accessor :name #:songs

     @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @songs = []
      # save
    end

    def self.all
      @@all
    end

    # def save
    #   self.class.all << self
    #
    # end
    def add_song(song)
      @songs << song
      song.artist = self
      # song_name
    end

    def songs
      # @songs << song
      Song.all.select {|song| song.artist == self}
    end



    def self.find_or_create_by_name(name)
      # existing_artist = self.all.find {|song| song.name == name}
      #   if existing_artist
      #     existing_artist
      #   else
      #     artist = self.new(name)
      #     artist.save
      #     artist
      #     # binding.pry
      #   end
      if self.find(name)
        self.find(name)
      else
        self.create(name)
      end
    end

    def self.find(name)
      @@all.find do |artist|
      artist.name == name
      end
    end

    def self.create(name)
      artist = self.new(name)
      artist
    end

    def print_songs
      self.songs.collect {|song| puts song.name}
    end
end
