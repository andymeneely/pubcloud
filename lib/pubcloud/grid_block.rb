require 'pubcloud/token'

class GridBlock

  def initialize(token, font_size)
    @token = token
    @font_size = font_size
    @font_scale = 1.0
  end
  
  def colspan
    (@token.name.length * @font_scale * @font_size).to_i
  end
  
  def rowspan
    (@font_scale * @font_size).to_i
  end

  def to_s
    "<td colspan=#{colspan} rowspan=#{rowspan}>#{@token.name}</td>"
  end
end
