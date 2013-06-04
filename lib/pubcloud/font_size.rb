require 'yaml'

class FontSize

  def initialize(font)
    @table = YAML.load_file('data/font_size.yml')[font.downcase]
    raise UnsupportedFont if @table.nil?
  end

  def width_of(str)
    total = 0.0
    str.each_char do |c|
      total+=@table[c]['width']
    end
    total
  end

  def height
    @table['height']
  end

  class UnsupportedFont < RuntimeError
  end
end
