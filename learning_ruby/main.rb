# ------------------------------9th day
arr = [1,2,3,4,5]
puts"#{arr[1...3] }"
puts"#{arr.length}"
puts"#{arr.empty?}"
arr.delete_at(1)
puts"#{arr}"
arr.insert(1,2)
puts"#{arr}"
arr.compact
arr.delete(5)
puts"#{arr}"
# arr.each {|a| print a-=10 ,' ' }
arr.reverse_each {|a| print a}
words = ['first','second','third']
words.each {|w| print w}
puts""
arr.map {|a| print a*2}

arr1=Array.new(arr)
puts"#{arr.eql?(arr1)}"
puts"#{arr*','}"
puts"#{arr<<10}"
puts"#{arr-[1]}"
a=Array.new
a[0,2]=['a','b']
puts "#{a}"

puts"#{arr.bsearch {|x| x>3}}"
puts "#{arr.combination(2).to_a}"
puts "#{arr.index(3)}"






# ------------------------------8th day
# first=Array.new(4,"mac")
# String functions~~~~~~~~~~~~~~~~~~~`
# puts"#{first.at(2)}"
# str=String.new("hello")
# puts"#{str}"
# x=String.try_convert(str);
# puts"#{+x}"

# puts"#{"hell"<=>"hellobye"}"
# y="tata"
# # puts"#{y.upcase}"
# # puts "#{y.center(20,'_')}"
# puts"#{y.gsub(/[aeiou]/ ,'*')}"
# puts"#{y.include? "ya"}"
# puts"#{y.inspect}"
# puts"#{y.match('a')}"


# puts "#{x<<y}"
# str1=String.new("hello")
# puts"#{str[3,2]}"





# ------------------------------7rd day
# puts "\al"
# puts '\al'

# mystr=String.new("this is mystr")
# mystr_upp=mystr.upcase
# puts mystr_upp






# ------------------------------6rd day
# $LOAD_PATH << '.'

# require "trig"
# require "moral"
# require "support"


# class Decade
# 	include Week
# 	no_of_yrs=10
# 	def no_of_months
# 		puts Week::First_Day
# 		number=10*12
# 		puts number
# 	end
# end
# d1=Decade.new
# puts Week::First_Day
# puts Decade::First_Day









# ------------------------------5rd day
# def test(&block)
# 	puts " in the method"
# 	block.call(6)
# 	yield 5
# 	yield 100
# end
# test {|a| puts  "in the block so value of a is #{a}"}








# ------------------------------4rd day
# def test(var1="ruby",var2="perl")
# 	puts "this is var1 #{var1}"
# 	puts "this is var2 #{var2}"
# end
# test "C","C++"
# test

# def test1(var1="ruby",var2="rails")
# 	i=10
# 	j=20
# 	k=30
# 	return i,j,k
# end
# var3=test1
# puts "#{var3}"


# def sample (*test)
# 	puts "the length of test is #{test.length}"
# 	for i in 0...test.length do
# 		puts"#{test[i]}"
# 	end
# end
# sample "a","aa","aaa"
# sample "b"





# ------------------------------3rd day
# $X=2
# while $X>0 do
# 	puts "#{$X}"
# 	$X=$X-1
# end

# puts "-----------"
# for y in 0..6 
# 	if y<2 then
# 		next
# 	end
# 	puts"#{y}"
# 	y=y+1
# 	if y>4 then 
# 		break
# 	end

# end

# for i in 0..3 
# 	retry if i > 2  # not working this retry statement
# 	puts "#{i}"
# end







# ---------------------------2nd day
# X=-1
# YOO=3
# if X>2
# 	puts"x is greater than 2"
# elsif X<2 and X>1
# 	puts"x is between 1 and 2"
# else
# 	puts "x is less than 1"
# end

# print "yes " if YOO 

# C=6
# unless C>3
# 	puts "c is less than 3"
# 	C=C-1
# else
# 	puts "c is finally  less than 3"
# end




# ----------------------- 1st day
# MR_COUNT=10
# module Foo
# 	MR_COUNT=0
# 	::MR_COUNT=100
# 	MR_COUNT=1
# end
# puts MR_COUNT
# puts Foo::MR_COUNT

# $global=10
# puts "first line of code in ruby"
# BEGIN{
# 	puts "this should be first line"
# }
# END{
# 	puts "this should be last line"
# }
# class Sample
# 	def hello
# 		puts"value of global is #{$global+$global}"
# 	end
# 	def initialize(count)
# 		@sample_count=count
# 	end
# end

# puts "#{defined? puts}" # => "global-variable"

# arey = [1,2,'three',"wew last element"]
# arey.each do |i|
# 	puts i
# end
# (10..15).each do |n|
# 	print n,' '
# end
# puts"\n"
# sample1=Sample. new(10);
# sample1.hello
#puts"sample1.@sample_count"

