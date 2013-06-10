class Arranger

  def initialize(layout, freq, text_size, max_font_em=4.5)
    @layout = layout
    @freq = freq
    @text_size = text_size
    @font_multiplier = max_font_em / Math.log10(freq.values.max)
  end

  # in ems
  def font_size(str)
    @font_multiplier * Math.log10(@freq[str])
  end


end
