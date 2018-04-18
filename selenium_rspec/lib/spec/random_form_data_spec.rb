require 'spec_helper'

describe 'Random Form Data' do

    context 'Testing the random form service' do
        
        before(:all) do
            @form_data_service = GenerateData.new.selenium_generate_data_service
        end

        it 'should return a random first_name which is a string' do
            expect(@form_data_service.faker_name).to be_a(String)
        end

        it 'should return a random phone_number of which a string and 11 characters' do
            expect(@form_data_service.faker_phone_number).to be_a(String)
            expect(@form_data_service.faker_phone_number.length).to eq 11
        end

        it 'should return a random birthday month of which a string and between 1-2 characters' do
            expect(@form_data_service.faker_birthday_month).to be_a(String)
            expect(@form_data_service.faker_birthday_month.length).to be_between(1,2)
        end

        it 'should return a random birthday month of which a string and between 1-2 characters' do
            expect(@form_data_service.faker_birthday_day).to be_a(String)
            expect(@form_data_service.faker_birthday_month.length).to be_between(1,2)
        end

        it 'should return a random birthday month of which a string and 4 characters' do
            expect(@form_data_service.faker_birthday_year).to be_a(String)
            expect(@form_data_service.faker_birthday_year.length).to eq 4
        end

        it 'should return a random country as a string' do
            expect(@form_data_service.faker_country).to be_a(String)
        end

        it 'should return a random user_name as a string' do
            expect(@form_data_service.faker_user_name).to be_a(String)
        end

        it 'should return a random email as a string' do
            expect(@form_data_service.faker_email).to be_a(String)
        end

        it 'should return a random password of which a string and greater then 8 characters' do
            expect(@form_data_service.faker_password).to be_a(String)
            expect(@form_data_service.faker_password.length).to be > 8
        end

        it 'should return a random number which is a String and 11 characters' do
            expect(@form_data_service.faker_phone_number).to be_a(String)
            expect(@form_data_service.faker_phone_number.length).to eq 11
        end

        it 'should return a faker_description which is a String' do
            expect(@form_data_service.faker_description).to be_a(String)
        end









    end
end