require "watir"
# require "headless"

# headless = Headless.new
# headless.start







browser = Watir::Browser.new :chrome


#going to site first page
browser.goto('https://teas.uspto.gov/forms/bas/')

#filling information on second page 
browser.radio(:name => 'form.attNeeded',:value => 'false').wait_until_present.set

browser.button(:value => "Continue").wait_until_present.click
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/1.png")
browser.text_field(:name => 'form.owner[0].ownerName').wait_until_present.set("Testing Inc.")
case second
  when 'Corporation'
  browser.radio(:name => 'form.owner[0].entityType',:value => '03').wait_until_present.set
  browser.select_list(:name => 'entityState').wait_until_present.select 'California'

else
  browser.radio(name: "form.owner[0].entityType", value: '99').wait_until_present.set
end



browser.select_list(:name => 'entityState').wait_until_present.select 'California'
browser.text_field(:name => 'form.owner[0].streetAddr').wait_until_present.set('PO BOX Testing 123')
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/2.png")
browser.text_field(:name => 'form.owner[0].city').wait_until_present.set('Santa Barbara')
browser.select_list(:name => 'form.owner[0].state').wait_until_present.select 'California'
browser.text_field(:name => 'form.owner[0].phone').wait_until_present.set('805 555 5555')
#browser.select_list(:name => 'form.owner[0].country').select 'United States'

browser.text_field(:name => 'form.owner[0].zipCode').wait_until_present.set(92067)
browser.text_field(:name => 'form.owner[0].email').wait_until_present.set('nicholas.greenside@gmail.com')
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/3.png")
browser.checkbox(:name => 'form.owner[0].mailAuth').wait_until_present.set


#third page asking for continue only
browser.button(:value => "Continue").wait_until_present.click
sleep(3)



#
# browser.button(:value => "  Continue  ").wait_until_present.click
browser.textarea(id: "MARK_TEXT").wait_until_present.set "Testing"
browser.checkbox(:name => 'form.additionalNeeded').wait_until_present.set
browser.text_field(:name => 'form.mark.statement(DISCLAIMER).arg[0]').wait_until_present.set('Testing')



# browser.text_field(:name => 'entry.1.single').set "I come here from 

# browser.checkbox(:name => 'form.additionalNeeded').set
# browser.radio(:name => 'form.cfstatementsForm.2f.whole.part.radio').set

browser.button(:value => "Continue").wait_until_present.click

#page 3

browser.radio(:value => 'FREETEXT').wait_until_present.set
sleep(3)
browser.button(:name => 'idmanual').wait_until_present.click

# puts browser.alert.text

browser.alert.ok if browser.alert.present?
# browser.button(:value => "Continue").wait_until_present.click

# browser.refresh
sleep(2)


browser.textarea(:name => 'form.gsList[0].gsText').wait_until_present.set('Testing')

browser.select_list(:name => 'form.gsList[0].classNumber').wait_until_present.select '005'




# browser.checkbox(:name => 'selectall').wait_until_present.clear
# browser.checkbox(:id => 'optionalFeature').wait_until_present.set


browser.button(:value => "Section 1(a)").wait_until_present.click
browser.textarea(:name => 'form.gs.basis[0].description').wait_until_present.set('Web Page')
browser.text_field(:name => 'form.gs.basis[0].date1').wait_until_present.set('02/00/2014')
browser.text_field(:name => 'form.gs.basis[0].date2').wait_until_present.set('02/00/2014')

browser.button(:value => "Attach/Remove Specimen").wait_until_present.click
browser.button(:name => "returntoTEAS").wait_until_present.click


browser.button(:value => "Assign Filing Basis").wait_until_present.click
browser.button(:value => "  Continue  ").wait_until_present.click




# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/4.png")
sleep(2)
browser.button(:value => "Continue").wait_until_present.click

browser.button(:value => "  Continue  ").wait_until_present.click

browser.checkbox(:name => 'form.attNeeded').wait_until_present.clear
# browser.text_field(:name => 'form.contact.ownerName').wait_until_present.set('Testing Inc.')
browser.text_field(:name => 'form.contact.firmName').wait_until_present.set('')
# browser.text_field(:name => 'form.contact.streetAddr').wait_until_present.set('555 Happy Street LN')
# browser.text_field(:name => 'form.contact.city').wait_until_present.set('Peaceland')
# browser.select_list(:name => 'form.contact.state').wait_until_present.select 'California'
# browser.text_field(:name => 'form.contact.zipCode').wait_until_present.set(55555)
# browser.text_field(:name => 'form.contact.email').wait_until_present.set('uspto@trademarks411.com')
# browser.checkbox(:name => 'form.contact.mailAuth').wait_until_present.set
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/5.png")
browser.button(:value => "Continue").wait_until_present.click

#page where money 275$ are shown and signature are required
sleep(2)
browser.radio(name: "form.signType",:value => "ESIGN").wait_until_present.set
sleep(2)
browser.text_field(:name => 'form.signature[0].signatoryName').wait_until_present.set('John Smith')
browser.text_field(:name => 'form.signature[0].signatoryPosition').wait_until_present.set('Owner')
# browser.text_field(:name => 'form.signature[0].signatoryPhone').wait_until_present.set(7737475876)
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/6.png")
browser.button(:value => "Validate").wait_until_present.click

browser.button(:value => "  Continue  ").wait_until_present.click




browser.link(:text => 'Text Form for E-Signature').wait_until_present
browser.link(:text => 'Text Form for E-Signature').click
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/7.png")

browser.link(:text => 'Send this Text Form to the authorized signatory(ies) to request e-signature(s)').wait_until_present
browser.link(:text => 'Send this Text Form to the authorized signatory(ies) to request e-signature(s)').click
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/8.png")


            browser.window(:title => "Trademark Electronic Application System (TEAS) - E-Signature(s) Request Form").use
              browser.text_field(name: 'fromName').wait_until_present

browser.text_field(name: 'fromName').set('Nicholas')
browser.text_field(name: 'fromAddr').wait_until_present.set('nicholas.greenside@gmail.com')
# UNDO THE LINE AFTER THIS TO SUBMIT THE EMAIL AND ALSO CHECK THIS IF IT IS WORKING
# browser.submit(:value => "  Send Email  ").wait_until_present.click  



# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/9.png")
sleep(10)
# browser.button(:value => " Send Email ").click







#browser.text_field(:name => 'form.owner[0].fax').set(array[9])






