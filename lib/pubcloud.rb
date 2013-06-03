require 'pubcloud/word_counter'
require 'pubcloud/version'
require 'trollop'

module Pubcloud
  class Pubcloud
    attr_reader :opts

    def initialize(opts)
      @opts = opts
    end 

    def freqs
        file = File.open(@opts[:file]); text = file.read; file.close
        WordCounter.new(text).frequencies(@opts[:words])
    end
  end

  def self.init_via_cli
    opts = Trollop::options do
      version "#{VERSION} (c) 2013 Andy Meneely"
      banner "Make a word cloud of your publications."
      opt :words, "Number of words to display", :default => 20
      opt :file, "The source file in plain text", :type => String
    end

    Trollop::die "No source file given. Use --file" unless opts[:file_given]
    Trollop::die :words, "must be at least 1" if opts[:words] < 1
    Trollop::die :file, "must exist" unless File.exist?(opts[:file])

    pc = Pubcloud.new(opts)
    puts pc.freqs
  end

end

