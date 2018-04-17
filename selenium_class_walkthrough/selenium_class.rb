require 'selenium-webdriver'

class SeleniumQaToolsForm

    PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'    
    FIRST_NAME_FIELD_NAME = 'firstname'
    LAST_NAME_FIELD_NAME = 'lastname'
    DATA_FIELD_NAME = 'datepicker'
    

    def initialize 
        @chrome_driver = Selenium::WebDriver.for :chrome
    end

    def visit_practice_form 
        @chrome_driver.get(PRACTICE_FORM_URL)
    end

    def input_firstname_field(text)
        @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
        sleep 5
    end

    def get_first_name_text
        puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
    end

    def input_lastname_field(text)
        @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
        sleep 4
    end

    def input_gender
        @chrome_driver.find_element(:id, 'sex-0').click
        sleep 4
    end

    def input_years_experience
        @chrome_driver.find_element(:id, 'exp-5').click
        sleep 4
    end

    def input_date_field(text)
        @chrome_driver.find_element(:id, 'datepicker').send_keys(text)
        sleep 4
    end

    def input_continent_field
        dropdown_list = @chrome_driver.find_element(id: 'continents')
        options = dropdown_list.find_elements(tag_name: 'option')
        options.each { |option| option.click if option.text == 'Europe' }
        sleep 4
    end

    def input_selenium_commands
        selenium_list = @chrome_driver.find_element(id: 'selenium_commands')
        options = selenium_list.find_elements(tag_name: 'option')
        options.each { |option| option.click if option.text == 'WebElement Commands' }
        sleep 4
    end

    def click_bottom_button
        @chrome_driver.find_element(:id, 'submit').click
    end


    def input_profession 
        @chrome_driver.find_element(:id, 'profession-1').click
        sleep 4
    end

    def input_experience
        @chrome_driver.find_element(:id, 'exp-0').click
        sleep 4
    end

    def input_automation_tool
        @chrome_driver.find_element(:id, 'tool-1').click
        sleep 1
        @chrome_driver.find_element(:id, 'tool-2').click
        sleep 4
    end

    def selenium_automation_download
        @chrome_driver.find_element(:link_text, 'Selenium Automation Hybrid Framework')
        sleep 4
    end

    def selenium_test_download
        @chrome_driver.find_element(:link_text, 'Test File to Download')
        sleep 4
    end

    def upload_picture
        filename = 'some-file.txt'
        @chrome_driver.find_element(id: 'file-upload').send_keys file
        @chrome_driver.find_element(id: 'file-submit').click
    end

end

form = SeleniumQaToolsForm.new
form.visit_practice_form
form.input_firstname_field("Jonny")
form.get_first_name_text
form.input_lastname_field("Vericiu")
form.input_gender
form.input_years_experience
form.input_date_field("2018-04-16")
form.input_profession
form.input_automation_tool
form.input_continent_field
form.input_selenium_commands
form.selenium_automation_download
form.selenium_test_download
form.click_bottom_button

