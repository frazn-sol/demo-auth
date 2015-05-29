task :save_countries => :environment do
	require 'open-uri'
	require 'base64'
	files = Dir.glob("#{Rails.root}/lib/Countries/*")
	files.each do |file|
		@flag = file.split("/").last
		@name = @flag.split(".").first.capitalize!
		@country = Country.new
		@country.name = @name
		@string = open(file.to_s)
		@country.flag = Base64.encode64(@string.read)
		@country.save
	end
end	