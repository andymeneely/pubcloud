class LayoutGrid

  def initialize(width,height)
    @width=width
    @height=height
    @grid = []
    (1..@height).each do |row|
      @grid[row] = []
      (1..@width).each do |col|
        @grid[row][col] = "&nbsp;"
      end
    end
  end

  def add!(grid_block,row,col)
    
  end

  def to_html
    html = ""
    (1..@height).each do |row|
      html << "<tr>"
      (1..@width).each do |col|
        html << "<td>#{@grid[row][col]}</td>"
      end
      html <<"</tr>"
    end
    "<table>#{html}</table>"
  end
end