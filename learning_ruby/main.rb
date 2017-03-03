k=1
for i in 0..5
	for j in 1..k
		print "#{j}"
		print " "
	end
	puts " "
	k+=1
end








#printing prime numbers between 1 to 5,000
# k=0
# prime = 1
# arr=Array.new()
# for i in 2..50
# 	for j in 2...i
# 		if i%j==0 then
# 			#nothing
# 			prime=0
# 			break
# 		end
# 	end
# 	if prime!=0
# 		# puts"#{i}"
# 		arr.insert(k,i)
# 		k+=1
# 	end
# 	prime=1
# end
# puts "#{arr}"

# for i in 2...10
# 	puts"#{i}"
# end







# ------------------------------15th day
# t1=Time.new()
# puts"#{t1}"
# puts"#{t1.day}"

# str1="String"
# str1<<"hello"
# puts"#{str1}"
# puts"#{str1.reverse}"





# ------------------------------14th day
# arr=[1,2,3,4,5,6]
# i=4
# if arr[i]>3 && arr[i]<5 then 
# 	puts"greater than 3"
# elsif arr[i]==5
# 	puts"5 is thr"
# else
# 	puts"dont know"
# end

# unless i>4
# 	puts"i not greater than 4"
# else 
# 	puts"i is finally greater than 4"
# end

# age=3
# case age
# when 0..2
# 	puts"baby"
# when 3..7
# 	puts"infant"
# else
# 	puts"grown"
# end

# while age<8 do
# 	puts"present age=#{age}"
# 	age+=1
# end

# # def printage(age=10)
# # 	print"enter your age"
# # 	age=gets
# # 	age.chomp
# # 	puts"#{age}"
# # end
# # printage

# def methods(*test)
# 	puts"variabe number of params"
# 	for i in 0...test.length
# 		puts"the params are \"#{test[i]}\" "
# 	end
# end
# methods "max",2,"hi five"

# class Accounts
# 	def savingmoney
# 		#
# 	end
# 	def Accounts.returndate
# 		#
# 	end
# end

# def blk(&block)
# 	puts"inside the method"
# 	block.call(5)
# end
# blk do 
# 	|v| puts"we  are in the block now with #{v}"
# end
# $LOAD_PATH <<'.'






# ------------------------------13th day
# grades={"key1"=>"value1","key2"=>"value2"}
# puts"#{grades}"
# # puts"#{grades.value(key2)}"
# dict={air:"SKY",science:"studies"}
# puts"#{dict}"
# puts"#{dict.key("SKY")}"
# puts"#{dict[:SKY]}"
# hsh=Hash.new()
# hsh["joe"]="eoj"
# hsh["ka"]="ak"
# puts"#{hsh}"
# hsh.default=0
# hsh2=Hash.new("go fish off")
# hsh2["first"]=1
# hsh2["second"]=2
# hsh2["third"]=3
# puts hsh2
# hsh4={"first"=>1,"third"=>3,"second"=>2}
# hsh3 = {first:1,third:3,second:2}
# puts"#{hsh4==hsh2}"
# puts hsh3
# puts hsh4
# puts "#{hsh4["second"]}"
# puts "#{hsh4["fourth"]=4}"
# puts "#{hsh4}"
# hsh4.delete("ghghg"){|x| puts "#{x}=> doesnt exist"}
# puts hsh4
# hsh4.each_key{|k| print "#{k}","   "}
# puts"#{hsh4.fetch_values("first","second",'third')}"
# puts"#{hsh4.to_s}"
# puts"#{hsh4.key(1)}"
# puts"#{hsh4.keys}"
# puts"#{hsh4.values}"
# puts"#{hsh4}"
# hsh4["fifth"]=5
# puts"#{hsh4}"
# hsh4.delete("fifth")
# puts"#{hsh4}"


# ------------------------------12th day
# arr=[1,2,3,4,5]
# arr.insert(2,[98,99,100]);
# puts"#{arr}"
# arr.insert(2,98,99,100);
# puts"#{arr}"
# arr1=arr*','
# puts"arr1 -> #{arr1} ~~~~~ arr -> #{arr}"
# arr.delete(2)
# puts"#{arr}"
# arr.delete_at(2)
# puts"#{arr}"
# puts"#{arr[1,2]}"
# arr3=Array.new(3) {|x| x=x*x}
# puts "#{arr3}"
# puts "~~~~~~~~~~~"
# str=" "
# print 2,"str",1
# arr5=arr3.reverse_each {|x| str+=x.to_s}
# puts "#{arr}"
# puts "#{arr.map {|x| x**2 }}"
# puts"#{[1,2]==[1,2]}"
# arr.insert(2,99)
# puts"#{arr}"
# puts"#{{arr.index(99)}"








# ------------------------------11th day
puts"#{Time.new(2002)}"
puts"#{Time.new()}"
t=Time.new()
t1=Time.new()
puts"#{t.monday?}"
puts"#{t.to_i}"
puts"#{t}"
y=Time.new(2000,3,15,14,05,22,"+04:00")
puts"#{y}"
puts"#{"%.7f"%t.to_f}"
puts"#{"%.7f"%t1.to_f}"
puts"#{t1.ctime}"
puts"#{t1.strftime("printed on %T %#B %m/%d/%Y")}"
begin
	raise "exception message"
rescue Exception => e
	puts e.message
	puts e.backtrace.inspect
	
end

def promptAndGet(prompt)
	print prompt
	res=readline.chomp
	throw :quitreq if res == "!"
	return res
end
catch :quitreq do
	name=promptAndGet("name:")
	age=promptAndGet("age:")
	sex=promptAndGet("sex:")

end
puts "program ending"


print file,"==",STDIN,"\n"

# ------------------------------10th day
# grades={"jim"=>2,"kim"=>5}
# puts"#{grades}"
# options={first:10,second:2}
# puts"#{options[:first]}"
# grades[:sita]="3"
# puts"#{grades}"
# other={first:33}
# puts"#{other}"
# h=Hash.new("go fish")
# h["a"]=1
# h["b"]=2
# h["c"]=3
# puts"#{h["d"].upcase!}"
# puts"#{h["f"]}"
# newhash=Hash.new{|k,l| newhash[l]=l.to_i*10}
# puts"#{newhash.default(2)}"
# grades.each{|a,b| puts"#{a} -> #{b}"}









# ------------------------------9th day
# arr = [1,2,3,4,5]
# puts"#{arr[1...3] }"
# puts"#{arr.length}"
# puts"#{arr.empty?}"
# arr.delete_at(1)
# puts"#{arr}"
# arr.insert(1,2)
# puts"#{arr}"
# arr.compact
# arr.delete(5)
# puts"#{arr}"
# # arr.each {|a| print a-=10 ,' ' }
# arr.reverse_each {|a| print a}
# words = ['first','second','third']
# words.each {|w| print w}
# puts""
# arr.map {|a| print a*2}

# arr1=Array.new(arr)
# puts"#{arr.eql?(arr1)}"
# puts"#{arr*','}"
# # puts"#{arr<<10}"
# puts"#{arr-[1]}"
# a=Array.new
# a[0,2]=['a','b']
# puts "#{a}"

# puts"#{arr.bsearch {|x| x>3}}"
# puts "#{arr.combination(2).to_a}"
# puts "#{arr.index(3)}"
# puts "#{[1,2,3]*2}"
# puts "#{[1,2,3]==[1,2,3]}"
# puts "#{arr}"
# arr[0,2]="a","b"
# puts "#{arr}"	
# puts"#{arr.delete("b")}"
# puts"#{arr}"
# puts"#{arr.first(2)}"
# arr.keep_if{|v| v=~/[abc]/}
# puts"#{arr}"







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

