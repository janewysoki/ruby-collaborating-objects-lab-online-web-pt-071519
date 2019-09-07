class Artist
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self #self refers to the instance we're creating
  end
  
  def self.all
    @@all
  end
  
  def songs
     Song.all.select do |song|
       song.artist == self #self here is the artist we're calling the method on (self is the receiver of the method call)
          #.artist is the getter method from the attr_accessor in the Song class
          #songs is gonna look through every song we have and just select the ones where the artist is equal to the artist we're calling this method onwill only return the songs
     end
  end
  
  def add_song(song)
    song.artist = self #self here refers to artist we're calling the method on; it's the receiver of the call to this method; particular instance that we're calling add_song on
      #.artist is the setter method from the attr_accessor in the Song class
  end

  def self.find_or_create_by_name(name)
    if artist = self.find(name) #self here refers to the Artist class; if artist equals the return value of find and is truthy, then execute line 30
      artist
    else
      self.new(name) 
    end
    #self.find(name) ? self.find(name) : self.new(name) - using the ternary
    #self.find(name) || self.new(name)  -- this could be the entire .find_or_create_by_name method
  end
  
  def self.find(name) #we have to create this .find method because line 29 says "self.find"
    @@all.find {|artist| artist.name == name} #find within the @@all array an artist whose name equals the name we're passing in
  end

  def print_songs   #when you see "all" (or "every" or "each") in the spec it usually means you need to iterate
    songs.each do |song| #calling the method songs
      puts song.name
    end
  end
end