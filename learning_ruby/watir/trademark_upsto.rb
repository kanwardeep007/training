desc 'Add Countries to Global Protect'
task :add_trademark => :environment do


order =  Questionnaire.find(14)


require "watir"
# require "headless"

# headless = Headless.new
# headless.start
def full_name(order)
    fullname = "#{order.try(:first_name)}  #{order.try(:last_name)}"
end

def partner_names_citizenship(order)
    partner_name_citizen = "#{order.partner_company_name} #{order.partner_state_country}"
end

def international_id(order)
  id = order.international_class_id
  newid =  id.size == 1 ? "00#{id}" : "0#{id}" 
end

def first_use_date(order)
  date = order.first_use.strftime("%m/%d/%y")
end

def first_commerce_use_date(order)
   date = order.first_use_commerce.strftime("%m/%d/%y")
end

browser = Watir::Browser.new 
# debugger
#FIRST PAGE OF THE SITE

browser.goto('https://teas.uspto.gov/forms/bas/')
# debugger

browser.radio(name: "form.reducedFeeFiled", value: "true").wait_until_present.set

        # if attorney_is_filing----
        #     browser.radio(name: "form.attNeeded", value: "true").wait_until_present.set
        # else
            browser.radio(name: "form.attNeeded", value: "false").wait_until_present.set
        # end

#END OF FIRST PAGE CONTINUE BUTTON 
browser.button(:value => "Continue").wait_until_present.click
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/1.png")
browser.text_field(:name => 'form.owner[0].ownerName').wait_until_present.set full_name(order)



      case order.entity_type
          when 'Corporation'
            browser.radio(:name => 'form.owner[0].entityType',:value => '03').wait_until_present.set
            if order.formed_in_us == "yes"
                browser.select_list(:name => 'entityState').wait_until_present.select order.corporation_state_country
              else
                browser.select_list(:name => 'entityCountry').wait_until_present.select order.corporation_state_country
            end
          when 'Individual'
              browser.radio(name: "form.owner[0].entityType", value: '01').wait_until_present.set
            browser.select_list(name: "form.owner[0].citizenship").wait_until_present.select order.individual_citizenship_country
          when 'Limited Liability Company'
              browser.radio(name: "form.owner[0].entityType", value: '16').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
            else
              browser.select_list(name: "entityCountry").select order.corporation_state_country
            end
          when 'Partnership'
              browser.radio(name: "form.owner[0].entityType", value: '02').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').set partner_names_citizenship(order)
            else
              browser.select_list(name: "entityCountry").select order.corporation_state_country
            end
          when 'Limited Partnership'
              browser.radio(name: "form.owner[0].entityType", value: '13').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').set partner_names_citizenship(order)
            else
              browser.select_list(name: "entityCountry").select order.corporation_state_country
            end
          when 'Joint Venture'
              browser.radio(name: "form.owner[0].entityType", value: '05').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').set partner_names_citizenship(order)
            else
              browser.select_list(name: "entityCountry").select order.corporation_state_country
            end
          when 'Sole Proprietorship'
              browser.radio(name: "form.owner[0].entityType", value: '19').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').set partner_names_citizenship(order)
            else
              browser.select_list(name: "entityCountry").wait_until_present.select order.corporation_state_country
            end
          when 'Trust'
              browser.radio(name: "form.owner[0].entityType", value: '17').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').set partner_names_citizenship(order)
            else
              browser.select_list(name: "entityCountry").wait_until_present.select order.corporation_state_country
            end
          when 'Estate'
              browser.radio(name: "form.owner[0].entityType", value: '18').wait_until_present.set
            browser.select_list(name: "entityState").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').wait_until_present.set partner_names_citizenship(order)
            else
              browser.select_list(name: "entityCountry").wait_until_present.select order.corporation_state_country
            end
          else
            browser.radio(name: "form.owner[0].entityType", value: '99').wait_until_present.set
            browser.select_list(name: "entityOtherDom").wait_until_present
            if order.formed_in_us == "yes"
              browser.select_list(name: "entityState").select order.corporation_state_country
              browser.textarea(name: 'form.owner[0].partnerName').wait_until_present.set partner_names_citizenship(order)
              browser.select_list(name: "entityOtherDom").select order.entity_type.downcase
            else
              browser.select_list(name: "entityCountry").wait_until_present.select order.corporation_state_country
              browser.select_list(name: "entityOtherFor").select order.entity_type
            end

end
 
              






browser.text_field(:name => 'form.owner[0].streetAddr').wait_until_present.set order.address
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/2.png")
browser.text_field(:name => 'form.owner[0].city').wait_until_present.set order.city
browser.select_list(:name => 'form.owner[0].state').wait_until_present.select order.corporation_state_country if order.formed_in_us == "yes"
# browser.text_field(:name => 'form.owner[0].phone').wait_until_present.set order.phone
browser.select_list(name: "form.owner[0].country").wait_until_present.select order.country


browser.text_field(:name => 'form.owner[0].zipCode').wait_until_present.set order.zip_code if order.formed_in_us == "yes"
browser.text_field(:name => 'form.owner[0].email').wait_until_present.set order.email_address
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/3.png")

browser.checkbox(:name => 'form.owner[0].mailAuth').wait_until_present.set if order.email_address.present?


#third page asking for continue only
#this line of code is lead by the previous implementation which stated - "For some reason it needs to call this twice on the uspto site IF not one of the main entities, so wierd!"
        if order.entity_type == 'Individual' || order.entity_type == 'Corporation' || order.entity_type == 'Limited Liability Company' || order.entity_type == 'Partnership' || order.entity_type == 'Limited Partnership' || order.entity_type == 'Joint Venture' || order.entity_type == 'Sole Proprietorship' || order.entity_type == 'Trust' || order.entity_type == 'Estate'
            browser.button(value: "Continue").wait_until_present.click
          else
            browser.button(value: "Continue").wait_until_present.double_click
          end

sleep(3)

if browser.button(value: "  Continue  ").present?
  browser.button(value: "  Continue  ").wait_until_present.click
end


if order.type_of_trademark == "word_mark"
  browser.radio(:name => 'form.mark.markCode',:value => "04").wait_until_present.set
  browser.textarea(id: "MARK_TEXT").wait_until_present.set order.trademark
  

else
  browser.radio(:name => 'form.mark.markCode',:value => "05").wait_until_present.set
  #COMPLETE THESE STEPS FOR IMAGE TRADEMARK ON THE SITE 

  file_url = order.logo.url(:thumb)
  # remote_file = s.submittable.mark_file.large
  browser.file_field(name:"form.mark.mark").wait_until_present.set file_url
  browser.button(name: "attach").wait_until_present.click

  if browser.button(value: "  Continue  ").present?
    browser.button(value: "  Continue  ").wait_until_present.click
  end
  #           get_file = open(remote_file)
  #           remote_file_ext = File.extname(remote_file)
  #           saved_file = Tempfile.new(["remote_file", remote_file_ext])
  #           saved_file.binmode
  #           saved_file.write(get_file.read)
  #           saved_file.rewind
  #           saved_file.path

  #           browser.file_field(name:"form.mark.mark").wait_until_present.set saved_file.path
  #           browser.button(name: "attach").wait_until_present.click
  browser.text_field(name: "form.mark.markText").wait_until_present.set s.submittable.design_mark_text if !s.submittable.design_mark_text.blank?
  # The Colors
  browser.textarea(name: "form.mark.statement(COLOR).arg[0]").wait_until_present.set s.submittable.design_mark_colors if !s.submittable.design_mark_colors.blank?
  # No Colors
  browser.checkbox(name: "form.mark.statement(CLAIMING_NOCOLOR).key").wait_until_present.set "CLAIMING_NOCOLOR" if s.submittable.design_mark_claiming_nocolor == false
  # Mark Description for Stylized/Designed
  browser.textarea(name: "form.mark.statement(DESCRIPTION).arg[0]").wait_until_present.set s.submittable.design_mark_description if !s.submittable.design_mark_description.blank?
        
end
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#THE FOLLOWING LINE IS COMMENNTED BECAUSE I DONT KNOW HOW TO SET IT USING DATABASE VALUE

  # value = order.additional_statement
#   statement = eval(value)

# [4:36]  
# statement = eval(value)

# [4:36]  
# statement[‘disclaimer’]

if checkbox_ticked
browser.checkbox(:name => 'form.additionalNeeded').wait_until_present.set
  value = order.additional_statement
  statement = eval(value)


    # Disclaimer
    browser.text_field(name: "form.mark.statement(DISCLAIMER).arg[0]").wait_until_present
    browser.text_field(name: "form.mark.statement(DISCLAIMER).arg[0]").when_present.set s.submittable.disclaimer if !s.submittable.disclaimer.blank?
    # previous Registrations
    browser.text_field(name: "arg0").when_present.set s.submittable.prior_registration_1 if !s.submittable.prior_registration_1.blank?
    browser.text_field(name: "arg1").when_present.set s.submittable.prior_registration_2 if !s.submittable.prior_registration_2.blank?
    browser.text_field(name: "arg2").when_present.set s.submittable.prior_registration_3 if !s.submittable.prior_registration_3.blank?
    browser.checkbox(name: "etc").when_present.set "on" if s.submittable.has_additional_us_reg == true

  submission_screenshot(browser,'page3.2',s)


    # Translation
    browser.text_field(name: "form.mark.statement(TRANSLATION_YES).arg[0]").when_present.set s.submittable.eng_trans_of if !s.submittable.eng_trans_of.blank?
    browser.text_field(name: "form.mark.statement(TRANSLATION_YES).arg[1]").when_present.set s.submittable.eng_trans_is if !s.submittable.eng_trans_is.blank?
    browser.text_field(name: "form.mark.statement(TRANSLATION_NO).arg[0]").when_present.set s.submittable.non_latin_translit_to_no_meaning if !s.submittable.non_latin_translit_to_no_meaning.blank?

    # Transliteration
    browser.text_field(name: "form.mark.statement(TRANSLITERATION_YES).arg[0]").when_present.set s.submittable.non_latin_translit_to if !s.submittable.non_latin_translit_to.blank?
    browser.text_field(name: "form.mark.statement(TRANSLITERATION_YES).arg[1]").when_present.set s.submittable.non_latin_tranlit_means_eng if !s.submittable.non_latin_tranlit_means_eng.blank?
    browser.text_field(name: "form.mark.statement(TRANSLITERATION_NO).arg[0]").when_present.set s.submittable.non_latin_translit_to_no_meaning if !s.submittable.non_latin_translit_to_no_meaning.blank?

    # Meaning or Significance of wording
    browser.text_field(name: "form.mark.statement(SIGNIFICANCE_YES).arg[0]").when_present.set s.submittable.mark_terms_with_meaning_art_for if !s.submittable.mark_terms_with_meaning_art_for.blank?
    browser.text_field(name: "form.mark.statement(SIGNIFICANCE_YES).arg[1]").when_present.set s.submittable.mark_terms_with_meaning if !s.submittable.mark_terms_with_meaning.blank?
    browser.text_field(name: "form.mark.statement(SIGNIFICANCE_NO).arg[0]").when_present.set s.submittable.term_with_no_sig if !s.submittable.term_with_no_sig.blank?
    browser.text_field(name: "form.mark.statement(SIGNIFICANCE_NO3).arg[0]").when_present.set s.submittable.words_with_no_foreign_meaning if !s.submittable.words_with_no_foreign_meaning.blank?

    # Names, portraits, signatures of individuals
    browser.text_field(name: "form.mark.statement(CONSENT).arg[0]").when_present.set s.submittable.names_ports_sigs if !s.submittable.names_ports_sigs.blank?
    browser.checkbox(name: "form.mark.statement(CONSENT_NO).key").when_present.set "on" if s.submittable.do_not_id_living_ind == true # This removed the above field's value

      cancel_or_update(s,browser,headless,"Processing",35)

    # Add consents
  if s.submittable.consents.count > 0
      s.update_columns(log: "#{s.log} #{Time.now} -- Page 3 - Uploading consents \n\n")

      browser.button(name: "upload3").when_present.click
      browser.alert.ok if browser.alert.present?
      # select consents
      browser.file_field(name:"upload").wait_until_present
      s.submittable.consents.each do |consent|
        puts "adding concents"

        if consent.asset_content_type == 'image/jpeg' || consent.asset_content_type == 'application/pdf'
          remote_file = consent.asset.url
      else
          remote_file = consent.large
      end

        get_file = open(remote_file)
        remote_file_ext = File.extname(remote_file)
        saved_file = Tempfile.new(["remote_file", remote_file_ext])
        saved_file.binmode
        saved_file.write(get_file.read)
        saved_file.rewind
        saved_file.path
        browser.file_field(name:"upload").when_present.set saved_file.path
        # attach consents
        browser.button(name: "Attach").when_present.click
    end
      # return after all consents are uploaded
    submission_screenshot(browser,'page3.3consents',s)
      browser.button(value: "Return to Form").when_present.click
      browser.button(value: "Return to Form").wait_while_present
  end
      cancel_or_update(s,browser,headless,"Processing",45)

  browser.checkbox(name: "form.mark.statement(MISCELLANEOUS).key").wait_until_present
    # Misc Statements
    browser.checkbox(name: "form.mark.statement(MISCELLANEOUS).key").when_present.set "MISCELLANEOUS" if s.submittable.miscellaneous.present? || s.submittable.misc_files.count > 0
    browser.textarea(name: "form.mark.statement(MISCELLANEOUS).arg[0]").when_present.set s.submittable.miscellaneous
    # Attach Misc statements
  if s.submittable.misc_files.count > 0
      s.update_columns(log: "#{s.log} #{Time.now} -- Page 3 - Uploading misc files \n\n")

      browser.button(name: "upload4").when_present.click
      # Misc attachments
      browser.file_field(name: "upload").wait_until_present

      s.submittable.misc_files.each do |misc|
        Watir::Wait.until {
          browser.file_field(name: "upload").value == ''
        }

        if misc.asset_content_type == 'application/pdf'
          remote_file = misc.asset.url
      else
          remote_file = misc.large
      end

        get_file = open(remote_file)
        remote_file_ext = File.extname(remote_file)
        saved_file = Tempfile.new(["remote_file", remote_file_ext])
        saved_file.binmode
        saved_file.write(get_file.read)
        saved_file.rewind
        saved_file.path
        browser.file_field(name: "upload").when_present.set saved_file.path
        # attach misc
        browser.button(id: "attachFile").when_present.click
    end
      # return after all consents are uploaded
    submission_screenshot(browser,'page 3.3 misc_files',s)
      browser.button(value: "   Return to Application  ").when_present.click
      browser.button(value: "   Return to Application  ").wait_while_present
  end

    submission_screenshot(browser,'page3.3',s)

# WHERE TO GET ADDITIONAL INFORMATION FOR (WHEN WE TICK CHECKBOX WE CAN FILL EXTRA INFORMATION)


end



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


browser.textarea(:name => 'form.gsList[0].gsText').wait_until_present.set order.goods_services

browser.select_list(:name => 'form.gsList[0].classNumber').wait_until_present.select international_id(order)

if order.current_use_yes == "true"
  browser.button(value: "Section 1(a)").wait_until_present.click



   # ATTACH SPECIMEN
          #   browser.button(name: "spec0").wait_until_present
          #   browser.button(name: "spec0").wait_until_present.click

          #   browser.file_field(name:"upload").wait_until_present
          #   s.submittable.goods_services[0].specimens.each do |specimen|
          #     s.update_columns(log: "#{s.log} #{Time.now} -- Page 4 - Uploading specimen \n\n")

          #     cancel_or_update(s,browser,headless,nil,70)

          #     Watir::Wait.until {
          #       browser.file_field(name:"upload").value == ''
          #     }

          #     if specimen.asset_content_type == 'application/pdf'
          #       remote_file = specimen.asset.url
          #   else
          #       remote_file = specimen.large
          #   end

          #     get_file = open(remote_file)
          #     remote_file_ext = File.extname(remote_file)
          #     saved_file = Tempfile.new(["remote_file", remote_file_ext])
          #     saved_file.binmode
          #     saved_file.write(get_file.read)
          #     saved_file.rewind
          #     saved_file.path
          #     browser.file_field(name:"upload").wait_until_present.set saved_file.path
          #     # attach misc
          #     browser.button(id: "attachFile").wait_until_present.click

          # end

          browser.file_field(name:"form.mark.mark").wait_until_present.set saved_file.path
                 browser.button(name: "attach").wait_until_present.click

   #THE DESCRIPTION OF HERE VARIOUS VALUES TO BE CHOSEN FROM IN THE DATABASE specimen_description , specimen_description_two,specimen_description_three ?????????
   browser.text_field(name: "form.gs.basis[0].date1").wait_until_present.set first_use_date
   browser.text_field(name: "form.gs.basis[0].date2").wait_until_present.set first_commerce_use_date


  else
    browser.button(value: "Section 1(b)").wait_until_present.click
    browser.checkbox(name: "form.gs.basis[0].check1b").wait_until_present.set "on"
end


 # browser.checkbox(:name => 'selectall').wait_until_present.clear
# browser.checkbox(:id => 'optionalFeature').wait_until_present.set


# browser.button(:value => "Section 1(a)").wait_until_present.click
# browser.textarea(:name => 'form.gs.basis[0].description').wait_until_present.set('Web Page')
# browser.text_field(:name => 'form.gs.basis[0].date1').wait_until_present.set('02/00/2014')
# browser.text_field(:name => 'form.gs.basis[0].date2').wait_until_present.set('02/00/2014')

# browser.button(:value => "Attach/Remove Specimen").wait_until_present.click
# browser.button(:name => "returntoTEAS").wait_until_present.click


browser.button(:value => "Assign Filing Basis").wait_until_present.click

if browser.button(value: "  Continue  ").present?
  browser.button(value: "  Continue  ").wait_until_present.click
end

sleep(2)

browser.button(:value => "Continue").wait_until_present.click

if browser.button(value: "  Continue  ").present?
  browser.button(value: "  Continue  ").wait_until_present.click
end

# if order.attorney_filling == "1"
#   browser.checkbox(:name => 'form.attNeeded' , :value => "on").wait_until_present.set
#   #WHAT IS THE ATTORNEY NAME FOR THE USER ???????
#   browser.text_field(name: "form.att.ownerName").wait_until_present.set ("????")
#   #OTHER ATTORNIES INFORMATION IN TEXT AREA
#   browser.text_field(name: "form.att.firmName").wait_until_present.set order.corporation_company_name

#   #WHAT IS INTERNAL ADDRESS
#   # browser.text_field(name: "form.att.internalAddr").wait_until_present.set s.submittable.attorney.address.internal
#   browser.text_field(name: "form.att.streetAddr").wait_until_present.set order.address
#   browser.text_field(name: "form.att.city").wait_until_present.set order.city
#   browser.select_list(name: "form.att.state").wait_until_present.select order.state if order.formed.in_us == "yes"
#   browser.select_list(name: "form.att.country").wait_until_present.select order.country
#   browser.text_field(name: "form.att.zipCode").wait_until_present.set order.zip_code if order.formed_in_us == "yes"
#   # browser.text_field(name: "form.att.phone").wait_until_present.set s.submittable.attorney.phone
#   browser.text_field(name: "form.att.fax").wait_until_present.set order.fax if order.fax.present?
#   # If an attorney is filing we do not want the CLIENT EMAIL (s.submittable.client_email) on the PTO app
#   browser.text_field(name: "form.att.email").wait_until_present.set order.email.address
#   # Allow USPTO to contact the attorney via email
#   browser.checkbox(name: "form.att.mailAuth").wait_until_present.set "on"



#   # browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/4.png")

# else
  browser.text_field(name: "form.contact.ownerName").wait_until_present.set order.full_name(order)

  browser.text_field(name: "form.contact.firmName").wait_until_present.set order.corporation_company_name

  #WHAT IS INTERNAL ADDRESS
  # browser.text_field(name: "form.att.internalAddr").wait_until_present.set s.submittable.attorney.address.internal
  browser.text_field(name: "form.contact.streetAddr").wait_until_present.set order.address
  browser.text_field(name: "form.contact.city").wait_until_present.set order.city
  browser.select_list(name: "form.contact.state").wait_until_present.select order.state if order.formed.in_us == "yes"
  browser.select_list(name: "form.contact.country").wait_until_present.select order.country
  browser.text_field(name: "form.contact.zipCode").wait_until_present.set order.zip_code if order.formed_in_us == "yes"
  # browser.text_field(name: "form.att.phone").wait_until_present.set s.submittable.attorney.phone
  browser.text_field(name: "form.contact.fax").wait_until_present.set order.fax if order.fax.present?
  # If an attorney is filing we do not want the CLIENT EMAIL (s.submittable.client_email) on the PTO app
  browser.text_field(name: "form.contact.email").wait_until_present.set order.email.address
  # Allow USPTO to contact the attorney via email
  browser.checkbox(name: "form.contact.mailAuth").wait_until_present.set "on"


# end

# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/5.png")


browser.button(:value => "Continue").wait_until_present.click

#page where money 275$ are shown and signature are required
sleep(2)
browser.radio(name: "form.signType",:value => "ESIGN").wait_until_present.set
sleep(2)
browser.text_field(:name => 'form.signature[0].signatoryName').wait_until_present.set full_name(order)
#POSITION IS NOT SPECIFIED IN TABLE 
browser.text_field(:name => 'form.signature[0].signatoryPosition').wait_until_present.set "????"

browser.text_field(:name => 'form.signature[0].signatoryPhone').wait_until_present.set order.phone
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/6.png")
browser.button(:value => "Validate").wait_until_present.click

if browser.button(value: "  Continue  ").present?
  browser.button(value: "  Continue  ").wait_until_present.click
end



browser.link(:text => 'Text Form for E-Signature').wait_until_present
browser.link(:text => 'Text Form for E-Signature').click
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/7.png")

browser.link(:text => 'Send this Text Form to the authorized signatory(ies) to request e-signature(s)').wait_until_present
browser.link(:text => 'Send this Text Form to the authorized signatory(ies) to request e-signature(s)').click
# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/8.png")


            browser.window(:title => "Trademark Electronic Application System (TEAS) - E-Signature(s) Request Form").use
              browser.text_field(name: 'fromName').wait_until_present

browser.text_field(name: 'fromName').set full_name(order)
browser.text_field(name: 'fromAddr').wait_until_present.set order.email_address
# UNDO THE LINE AFTER THIS TO SUBMIT THE EMAIL AND ALSO CHECK THIS IF IT IS WORKING
browser.button(value:' Send Email ').wait_until_present.click 



# browser.screenshot.save ("/Users/kanwardeepsingh/Desktop/training/learning_ruby/watir/9.png")
sleep(10)
# browser.button(:value => " Send Email ").click
browser.text_field(name: 'fromName').wait_until_present.set





#browser.text_field(:name => 'form.owner[0].fax').set(array[9])








end





# additional_statement in database for checkbox to be filled