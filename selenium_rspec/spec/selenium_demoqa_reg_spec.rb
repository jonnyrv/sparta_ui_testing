require 'spec_helper'
require 'generate_data'

describe 'testing the demoqa registration page' do

    before(:all) do
        @driver = SeleniumDemoReg.new
        @driver.access_registration_form
        @wait = Selenium::WebDriver::Wait.new(timeout: 10)
        @fake = GenerateData.new.selenium_generate_data_service
        @fname = @fake.faker_name
        @lname = @fake.faker_name
        @birthday_month = @fake.faker_birthday_month
        @birthday_day = @fake.faker_birthday_day
        @birthday_year = @fake.faker_birthday_year
        @country = @fake.faker_country 
        @email = @fake.faker_email
        @password = @fake.faker_password
        @user_name = @fake.faker_user_name
        @phone_number = @fake.faker_phone_number
        @description = @fake.faker_description
    end

    context 'positive paths for the registration form and register' do
        it 'should land on the registration page' do
            expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
        end

        it 'should accept a first name' do
            @driver.first_name_field_displayed
            @driver.set_first_name_field(@fname)
            expect(@driver.get_first_name_field_value).to eq @fname
        end

        it 'should accept a last name' do
            @driver.last_name_field_displayed
            @driver.set_last_name_field('Vericiu')
            expect(@driver.get_last_name_field_value).to eq 'Vericiu'
        end


    it 'should accept a marital status selection of Single, Married, or Divorced' do
        expect(@driver.select_marital_option('Single')).to eq true
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
        expect(@driver.select_hobby_option('Dance')).to eq true
    end

    it 'should have a country default of Afhghanistan' do
        expect(@driver.get_selected_country).to eq 'Afghanistan'
    end

    it 'accept a new DOB' do
        @driver.dob_month_list_select(@birthday_month)
        @driver.dob_day_list_select(@birthday_day)
        @driver.dob_year_list_select(@birthday_year)
    end

    it 'should accept a new country value' do
        @driver.country_dropdown_list_select(@country)
        # expect(@driver.get_selected_country).to eq 'Japan'
    end

    it 'should accept a valid phone number' do
        @driver.set_phone_number_field(@phone_number)
        expect(@driver.get_phone_number_field_value).to eq @phone_number
        expect(@driver.get_phone_number_field_value.length).to eq 11
    end

    it 'should accept a username' do
        @driver.set_user_name_field(@user_name)
        expect(@driver.get_user_name_field_value).to eq @user_name
    end

    it 'should accept a email' do
        @driver.set_email_field(@email)
        expect(@driver.get_email_field_value).to eq @email
    end

    it 'should accept a about yourself text' do
        @driver.set_about_yourself_field(@description)
        expect(@driver.get_about_yourself_value).to eq @description
    end

    it 'should accept a password' do
        @driver.set_password_field(@password)
        expect(@driver.get_password_value).to eq @password
    end

    it 'should accept a password confirmation' do
        @driver.set_confirmation_password_field(@password)
        expect(@driver.get_confirmation_password_value).to eq @password
    end

    it 'should register successfully' do
        @driver.click_submit
        @wait
        @driver.check_registration_successful
        expect(@driver.check_registration_successful).to eq 'Thank you for your registration'
        sleep 5
    end

 

        

    end
end