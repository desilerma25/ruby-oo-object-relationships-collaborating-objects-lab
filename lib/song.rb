# resp. for creating songs given each filename & 
# sending each artist name to Artist class
# relies on Artist class
class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        # parse a file name to find song & art. name
        # create new song inst. using str we gathered from filename
        # assoc. new song w. artist, use artist attr_acc.
        # return new song inst.
        song_name = filename.split(" - ")[1] 
        artist = filename.split(" - ")[0] 
        song = self.new(song_name)
        song.artist_name = artist
        song
    end

    def artist_name=(name)
        # turn art. name as str into an Artist obj
            # create or find the Artist inst. that rep. the artist.
            # collab w. Artist, send artist name to Artist to get functionality
            # use met. Artist.find_or_create_by_name
        # assign song to art. inst. collab w. Artist by calling Artist.add_song(song)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end