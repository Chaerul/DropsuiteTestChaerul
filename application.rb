class Application

	def show_all_dir
		directory = Dir.glob('DropsuiteTest/*').select {|f| File.directory? f.slice! 'DropsuiteTest/'}
		return directory
	end

	#select directory by input user
	def select_directory(dir)
		file = []

		if dir.empty?
			directory = Dir.glob("DropsuiteTest/")
		else
			directory = Dir.glob("DropsuiteTest/#{dir}/")
			if directory.empty?
				return "The directory is not found"
			end
		end

		#get all file from directory and sub directory
		directory.each{|d| file += Dir.glob("#{d}/**/*")}
		val = read_content(file)
		val = "#{val.keys[0]} #{val.values[0]}"
		return val
	end

	#read content from file
	def read_content(file)
		content = []
		file.each do |f|
			if File.file?(f)
				File.open(f, "r") do |f|
					word = ""
					f.each_line do |line|
						word += "#{line}"
					end
					content += [word]
				end
			end			
		end
		return calculate_content(content)
	end

	#ascending same content
	def calculate_content(content)
		val_content = Hash.new(0)
		content.each do |c| 
			val_content[c] += 1 
		end
		return val_content.sort_by {|k,v| v}.reverse.to_h
	end
end