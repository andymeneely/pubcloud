require 'yaml'

class TextSize

  def initialize(font, px_per_em=16)
    @table = YAML.load_file('data/font_size.yml')[font.downcase]
    raise UnsupportedFont if @table.nil?
    @px_per_em = px_per_em
  end

  def px_width_of(str)
    total = 0.0
    str.each_char do |c|
      total+=@table[c]['width']
    end
    total
  end

  def em_width_of(str)
    px_width_of(str)/@px_per_em
  end

  def px_height
    @table['height']
  end

  def em_height
    px_height / @px_per_em
  end

  class UnsupportedFont < RuntimeError
  end
end
