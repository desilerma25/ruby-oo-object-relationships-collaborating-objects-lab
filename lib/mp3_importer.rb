# parse all the filename and send to Song class
# relies on Song class
class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files # turns filepath into str. & removes .mp3 (directory)
        @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
        #Dir.glob rtns array contain. matching files
        # /*.mp3 looks for files that end in .mp3
        # use .gsub to sub out .mp3 for nothing ("")
    end

    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end
end