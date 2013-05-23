
class SpiralIterator

  def initialize(center={:x=>0, :y=>0}, max_size=10, num_steps=5, squashdown = 1.0, round = :true)
    @center = center
	@scale = max_size / Math.sqrt(num_steps)
	@num_steps = num_steps
	@squashdown = squashdown
	@round = round
  end

  def each
    return :false unless block_given?
	
	last_theta = 0.0
	(1..(@num_steps)).each do |i|
	  radius = Math.sqrt(i) * @scale
	  theta = last_theta + Math.asin(1.0/radius) * @scale;
	  puts "i: #{i}, radius: #{radius}, theta: #{theta}, center: #{@center}, squashdown: #{@squashdown}, scale: #{@scale}"
	  x = @squashdown * radius * Math.cos(theta) + @center[:x]
	  y = radius * Math.sin(theta) + @center[:y]
	  x = x.round if @round
	  y = y.round if @round
	  last_theta = theta
	  yield(x,y)
	end
  end

end