class IgnoredList
  def initialize(file_str='data/ignored_words.txt')
    @file_str = file_str
    load_ignored
  end

  def ignore?(word)
    @ignored[word] == :true
  end

  private

  def load_ignored
    @ignored = Hash.new
    file = File.open(@file_str)
    file.each_line{|line| @ignored[line.strip]=:true}
    file.close
  end

end
