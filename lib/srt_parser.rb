def carriage_return_to_linefeed str
  str.gsub("\r", '')
end
def remove_bom str
  str.gsub("\uFEFF", '')
end
def remove_id_and_timeline str
  result = []
  str.each_line do |line|
    result << line unless (line =~ /^\d\d.*\d\d:.*/ || line =~ /^\d+$/)
  end
  result.join
end
def remove_tags str
  str.gsub(/<[^<]*>/, '')
end
def remove_empty_lines str
  str.gsub(/^\s*$\n/, '')
end
def srt_to_text str
  r = remove_bom str
  r = carriage_return_to_linefeed r
  r = remove_tags r
  r = remove_id_and_timeline r
  remove_empty_lines r
end
