class MusicImporter
  
  @@files = []
  
  def initialize(path)
    @path = path
    @@files << path
  end
  
  def path
    @path
  end
  
  def files
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
  end
  
  def import
    files.each {|filename| Song.create_from_filename(filename)}
    @@files << files
  end
  
  
end