#!/usr/bin/ruby
puts "first line of code in ruby"
# BEGIN{
# 	puts "this should be first line"
# }
# END{
# 	puts "this should be last line"
# }
class Sample
	@sample_count=13
	def hello
		puts"this is hello from class sample"
	end
	def initialize(count)
		@sample_count=count
	end
end
sample1 = Sample. new(10);
sample1.hello
#puts"sample1.@sample_count"
