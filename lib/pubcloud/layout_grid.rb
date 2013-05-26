class LayoutGrid

  def initialize(width,height)
    @width=width
    @height=height
    @grid = Array.new(height)
    (0..@height-1).each do |row|
      @grid[row] = Array.new(width)
      (0..@width-1).each do |col|
        @grid[row][col] = "<td>&nbsp;</td>"
      end
    end
  end

  def add!(grid_block,row,col)
    (row..row+grid_block.rowspan-1).each do |i|
      (col..col+grid_block.colspan-1).each do |j|
        @grid[i][j] = '!' # overwritten by rowspan/colspan
      end
    end
    @grid[row][col] = grid_block
  end

  def to_html
    html = ""
    (0..@height-1).each do |row|
      html << "<tr>"
      (0..@width-1).each do |col|
        @grid[row][col].eql?("!") || html << @grid[row][col].to_s
      end
      html <<"</tr>"
    end
    "<table>#{html}</table>"
  end
    
end