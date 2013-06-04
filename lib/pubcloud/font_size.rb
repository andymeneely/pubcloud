require 'yaml'

class FontSize

  def initialize(font=:rockwell)
    @table = YAML.load_file('data/font_size.yml')['font']
  end

  def of(str)
    total = 0.0
    str.each_char do |c|
      total+=@table[c]['width']
    end
    total
  end

end
