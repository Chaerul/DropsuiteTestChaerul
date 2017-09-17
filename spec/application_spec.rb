require_relative '../application'

describe Application do
	
	app = Application.new

	it "Testing wrong directory" do
		expect(app.select_directory('c')).to eql "The directory is not found"
	end

	it "Testing right directory" do
		expect(app.select_directory('A')).to eql("abcdef 1")
	end
end