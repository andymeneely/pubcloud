#!/usr/bin/env ruby
require 'rubygems'
require 'fast_stemmer'
require 'tokenizer'

#text=File.open('paper.txt').readlines.flatten
text="Behind every piece of software is a team of people. In large software development projects, no single person can possibly know every aspect of the system, so the team must self-organize into various structures of communication and coordination. Lack of team cohesion, miscommunications, and misguided effort can lead to all kinds of problems, including security vulnerabilities. In my research, I focus on examining the statistical relationships between development team structure and security vulnerabilities."

freq = Hash.new

tokenizer = Tokenizer::Tokenizer.new
tokenizer.tokenize(text).each{|token|
  stem = token.downcase.stem
  freq[stem] ||= Array.new
  freq[stem] << token
}

freq.each{|key, value|
  puts "#{key}\t#{value}"
}

