def carriage_return_to_linefeed str
  str.gsub("\r", '')
end
def iyc_srt_to_text str
  result = []
  str.each_line do |line|
    result << line unless (line =~ /^\d\d.*\d\d:.*/ || line =~ /^\d+$/)
  end
  result.join
end
def iyc_remove_tags str
  str.gsub(/<[^<]*>/, '')
end
def iyc_remove_empty_lines str
  str.gsub(/^\s*$/, '')
end
