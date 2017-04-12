require "selenium-webdriver"
browser = Selenium::WebDriver.for :chrome
browser.get "http://google.com"
p browser.current_url
p browser.title
browser.close
browser.quit

