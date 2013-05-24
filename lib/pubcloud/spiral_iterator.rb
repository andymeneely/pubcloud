
class SpiralIterator

  def initialize(width=10,center={:row=>0, :col=>0})
	@width = width
    @center = center
  end

  def each
    return :false unless block_given?
    row = @center[:row]
    col = @center[:col]
    direction = distance = 1
    yield(row,col)
    while (distance <= @width/2)
        # Move the cols right
        begin 
          col+=direction
          yield(row,col)
        end while( (col-@center[:col]).abs < distance)
        
        # Move rows up
        direction *= -1
        begin 
          row+=direction
          yield(row,col)
        end while( (row-@center[:row]).abs < distance)
        
        # Move cols left
        begin
          col+=direction
          yield(row,col)
        end while( (col-@center[:col]).abs < distance)
        
        # Move rows down
        direction *=-1
        begin
          row+=direction
          yield(row,col)
        end while( (row-@center[:row]).abs < distance)
        
        # Move the cols right
        begin 
          col+=direction
          yield(row,col)
        end while( (col-@center[:col]).abs < distance)
        
        distance += 1
    end
  end    
end