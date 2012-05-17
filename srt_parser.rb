open 'test.srt' do |f|
	while(line = f.gets)
		puts line unless line =~ /^\d\d.*\d\d:.*/m
	end

end