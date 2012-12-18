
require_relative 'lib/srt_parser.rb'

# USAGE: ruby script.rb inputfile.srt
# input: srt file
# output: to standard output, timeline is removed
#         id is kept

file = File.expand_path ARGV[0]
File.open file do |f|
  while(line = f.gets)
    #    puts line unless line =~ /^\d\d.*\d\d:.*/m
    puts iyc_srt_to_text(line) unless line =~ /^\d\d.*\d\d:.*/m
  end
end
