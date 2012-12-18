
# the code is copied from orignial srt_parser.rb
# https://github.com/hyde1004/srt_parser

def remove_id_and_timeline file
  result = ''
  while(line = str.gets)
    result << line unless line =~ /^\d\d.*\d\d:.*/m
  end
  p result
end

file = File.read('../test/small.srt')
remove_id_and_timeline file
