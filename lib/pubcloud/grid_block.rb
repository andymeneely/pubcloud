require 'pubcloud/token'

class GridBlock

	def initialize(token, font_size)
    @token = token
    @font_size = font_size
    @font_scale = 1.0
  end
  
  def rowspan
    @token.name.length * @font_scale * @font_size
  end
  
  def colspan
    @font_scale * @font_size
  end
end