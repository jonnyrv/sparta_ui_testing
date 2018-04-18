require 'selenium-webdriver'

class SeleniumQaToolsForm

    PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'    
    FIRST_NAME_FIELD_NAME = 'firstname'
    LAST_NAME_FIELD_NAME = 'lastname'
    DATA_FIELD_NAME = 'datepicker'
    CLICK_TOOL_ARRAY = ['tool-1', 'tool-2']
    TEST_CLICK_DOWNLOAD = 'Test File to Download'
    

    def initialize 
        @chrome_driver = Selenium::WebDriver.for :chrome
    end

    def visit_practice_form 
        @chrome_driver.get(PRACTICE_FORM_URL)
    end

    def input_firstname_field(text)
        @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(text)
    end

    def get_first_name_text
        puts @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME)['value']
    end

    def input_lastname_field(text)
        @chrome_driver.find_element(:name, LAST_NAME_FIELD_NAME).send_keys(text)
    end

    def input_gender
        @chrome_driver.find_element(:id, 'sex-0').click
    end

    def input_years_experience
        @chrome_driver.find_element(:id, 'exp-5').click
    end

    def input_date_field(text)
        @chrome_driver.find_element(:id, 'datepicker').send_keys(text)
    end

    def input_continent_field(continent)
        dropdown_list = @chrome_driver.find_element(id: 'continents')
        options = dropdown_list.find_elements(tag_name: 'option')
        options.each { |option| option.click if option.text == continent }
    end

    def input_selenium_commands(command)
        selenium_list = @chrome_driver.find_element(id: 'selenium_commands')
        options = selenium_list.find_elements(tag_name: 'option')
        options.each { |option| option.click if option.text == command }
    end

    def click_bottom_button
        @chrome_driver.find_element(:id, 'submit').click
    end


    def input_profession 
        @chrome_driver.find_element(:id, 'profession-1').click
    end

    def input_experience
        @chrome_driver.find_element(:id, 'exp-0').click
    end

    def input_automation_tool
        @chrome_driver.find_element(:id, CLICK_TOOL_ARRAY[0]).click
        @chrome_driver.find_element(:id, CLICK_TOOL_ARRAY[1]).click
    end

    def selenium_automation_download
        @chrome_driver.find_element(:link_text, 'Selenium Automation Hybrid Framework').click
    end

    def selenium_test_download
        @chrome_driver.find_element(:link_text, TEST_CLICK_DOWNLOAD).click
    end

    def upload_picture
        filename = 'file_path'
        @chrome_driver.find_element(id: 'upload').send_keys filename
        @chrome_driver.find_element(id: 'submit').click
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
form.input_continent_field('Europe')
form.input_selenium_commands('WebElement Commands')
form.selenium_automation_download
form.selenium_test_download
form.click_bottom_button

