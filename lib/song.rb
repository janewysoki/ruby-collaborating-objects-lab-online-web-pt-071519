class Song
  
  attr_accessor :name, :artist #this is saying that artist belongs to a song, 
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename
  end
  
  def artist_name=(artist_name)
    
  end

end