require 'pubcloud/token'

class GridBlock
  @font_scale = 1.0

	def initialize(token, font_size)
    @token = token
    @font_size = font_size
  end
  
  def rowspan
    token.name.length * font_scale * font_size
  end
  
  def colspan
    
  end
end