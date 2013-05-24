
class SpiralIterator

  def initialize(center={:x=>0, :y=>0}, max_size=10, num_steps=5, squashdown = 1.0, round = :true)
    @center = center
	@scale = max_size / num_steps
	@num_steps = num_steps
	@squashdown = squashdown
	@round = round
  end

  def each
    return :false unless block_given?
	
	slast_theta = 0.0
	(0..(@num_steps-1)).each do |i|
	  radius = i * @scale
	  theta =  radius;
	  puts "i: #{i}, radius: #{radius}, theta: #{theta}, center: #{@center}, squashdown: #{@squashdown}, scale: #{@scale}"
	  x = @squashdown * radius * Math.cos(theta) + @center[:x]
	  y = radius * Math.sin(theta) + @center[:y]
	  x = x.round if @round
	  y = y.round if @round
	  yield(x,y)
	end
  end

end