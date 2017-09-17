
require_relative 'application'

app = Application.new()
puts "DropsuiteTest Application"
puts "========================================"
puts "LIST DIRECTORY"
puts app.show_all_dir
puts "========================================"
puts "Please Type directory name or leave blank for show all content, Note(Case Sensitive):"
puts "========================================"
dir_val = gets.chomp


app = app.select_directory(dir_val)

puts app
