# -*- coding: utf-8 -*-
require_relative 'lib/srt_parser.rb'
require 'find'

# USAGE: ruby script.rb inputfolder
# convert srt files in inputfolder to plain text files
# remove id and timestamp
# make a new file named original_filename.txt
# ??? 我不明白为什么id 1这行总是保留的
# 那是因为有 BOM
# 因此最好先转有bom的utf8到没有bom的
# 否则第一行match不上
# 因为第一行实际上是 <U+FEFF>1 
# 因此match不上 ^\d+$

path = File.expand_path ARGV[0]

Find.find(path) do |file|
  next unless file =~ /\.srt$/i
  text =  File.read(file)
  text = srt_to_text(text)
  filename = File.basename(file, '.srt')
  dir = File.dirname(file)
  new_file = File.join(dir, "#{filename}.txt")
  File.open(new_file, 'w') do |f|
    f.puts text
  end
end


