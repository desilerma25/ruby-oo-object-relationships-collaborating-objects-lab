# resp. for creating (if doesn't exist) or finding the inst. of that artist
class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all # return all Artist inst.
        @@all
    end

    def add_song(song) # a passed in song belongs to this Art. inst.
        song.artist = self
    end

    def songs # rtns array of songs that belong to artist inst.
        # get all Song inst. & select ones that match artist
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name) # take name passed, find or create
        if self.find(name)
            self.find(name)
        else
            self.new(name)
        end
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    def save
        @@all << self
    end

    def print_songs # outputs names of all songs assoc. w/ artist inst.
        songs.each {|song| puts song.name}
    end
end