require 'pubcloud/word_counter'
require 'pubcloud/version'
require 'pubcloud/text_size'
require 'pubcloud/arranger'
require 'pubcloud/layout_grid'
require 'trollop'

module Pubcloud
  class Pubcloud
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end 

    def build
      file = File.open(@opts[:file]); text = file.read; file.close
      freqs = WordCounter.new(text).frequencies(@opts[:min],@opts[:use_ignores])
      text_size = TextSize.new('rockwell')
      max_font_em = 4
      arr = Arranger.new(freqs, text_size, max_font_em)
      grid = arr.lay_it_out(LayoutGrid.new(100,100))
      puts grid.to_html
    end
  end

  def self.init_via_cli
    opts = Trollop::options do
      version "#{VERSION} (c) 2013 Andy Meneely"
      banner "Make a word cloud of your publications."
      opt :min, "Minimum number of times a word must occur to be included", :default => 1
      opt :use_ignores, "Use the built-in ignore listing?", :default => true
      opt :file, "The source file in plain text", :type => String
    end

    Trollop::die "No source file given. Use --file" unless opts[:file_given]
    Trollop::die :min, "must be at least 1" if opts[:min] < 1
    Trollop::die :file, "must exist" unless File.exist?(opts[:file])

    pc = Pubcloud.new(opts)
    pc.build
  end

end

