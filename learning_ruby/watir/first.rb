require "watir"
browser = Watir::Browser.new :chrome
browser.goto('http://blog.railsrumble.com')
puts "yes it checks " if browser.text.include? 'Throughout the years, teams have always asked if they had to use Rails, or could they use another Ruby framework instead. And we’ve always said you could use any Ruby framework you wanted. Well, now it’s time to make it official. Rails Rumble is now '
# browser.text_field(:name => 'q').set('watir')
# browser.button(:name => 'btnG').click
# browser.link(:text => /Watir\.com/).wait_until_present
# browser.link(:text => /Watir\.com/).click
# browser.button(:name => 'btnk').click




# def international_id(order)
#   id = order.international_class_id
#   newid =  if id.size == 1 ? "00#{id}" : "0#{id}" 
# end


  browser.button(value: /Continue/).wait_until_present.click if browser.text.include? 'To avoid unnecessary delays in processing your application, we strongly recommend you Go Back to enter the information referenced in the warning message above. However, because this information is not mandatory, if you so choose, you may use the button below to continue.'



# international_id(order)