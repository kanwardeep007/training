require "selenium-webdriver"
browser = Selenium::WebDriver.for :chrome
browser.get "http://google.com"
browser.find_element(name: "q")
browser.find_element(name: "q").send_keys "watir"
browser.find_element(name: "q").clear
browser["gbqfq"]
p browser["gbqfq"].attribute(:name)
p browser["gbqfq"].attribute(:class)
p browser["gbqfq"].attribute(:outerHTML)
p browser["gbqfq"].attribute(:style)
