require 'pubcloud/spiral_iterator'

class Arranger

  def initialize(freq, text_size, max_font_em=4.5)
    @freq = freq
    @text_size = text_size
    @font_multiplier = max_font_em / Math.log10(freq.values.max)
  end

  # in ems
  def font_size(str)
    @font_multiplier * Math.log10(@freq[str])
  end

  def lay_it_out(g)
    raise unless g.is_a? LayoutGrid
    table = sort_freq
    table.each do |t|
      #TODO Only supports square layouts!
      SpiralIterator.new(g.width, {:row => g.width/2,:col => g.width/2}).each do |row, col |
        ret = g.add!(GridBlock.new(Token.new(t[0]), 1.0), row, col)
        #puts "Attempting to put #{t.inspect} at #{row},#{col}... result: #{ret}"

        break if ret == :ok
      end
    end
    return g
  end

  private 
  def sort_freq
    table = @freq.sort do |a,b|
      if((a[1] <=> b[1]) == 0)
        b[0] <=> a[0] # Sort by token alphabetical, if tied
      else
        b[1] <=> a[1] # Sort by token count
      end
    end
    table
  end
end
