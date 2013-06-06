class LayoutGrid
  @@empty = "<td>&nbsp;</td>"
  attr_reader :grid

  def initialize(width,height)
    @width=width
    @height=height
    @grid = Array.new(height)
    (0..@height-1).each do |row|
      @grid[row] = Array.new(width)
      (0..@width-1).each do |col|
        @grid[row][col] = @@empty
      end
    end
  end

  def add!(grid_block,row,col)
    iterate_grid_block(grid_block,row,col) {|i,j| return :out_of_bounds if (i<0 || i>=@height || j<0 || j>=@width)}
    iterate_grid_block(grid_block,row,col) {|i,j| return :collision if @grid[i][j].eql?(:taken)}
    iterate_grid_block(grid_block,row,col) {|i,j| @grid[i][j] = :taken} # overwritten by rowspan/colspan
    @grid[row][col] = grid_block
    :ok
  end

  def to_html
    html = ""
    (0..@height-1).each do |row|
      html << "<tr>"
      (0..@width-1).each do |col|
        @grid[row][col].eql?(:taken) || html << @grid[row][col].to_s
      end
      html <<"</tr>"
    end
    "<table>#{html}</table>"
  end
    
  private
  
  #Iterate over the grid block within its colspan and rowspan
  def iterate_grid_block(grid_block, row, col)
    (row..row+grid_block.rowspan-1).each do |i|
      (col..col+grid_block.colspan-1).each do |j|
        yield(i,j)
      end
    end
  end
  
end
