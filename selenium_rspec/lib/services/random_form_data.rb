require 'faker'

class GenerateDataFormRandom

    def faker_name
        Faker::Name.name
    end

    def faker_birthday_month
        num = rand(1..12)
        num.to_s
    end

    def faker_birthday_day 
        num = rand(1..31)
        num.to_s
    end

    def faker_birthday_year
        num = rand(1950..2014)
        num.to_s
    end

    def faker_phone_number
        num = Faker::Number.number(10)
        '0' + num
    end

    def faker_country 
        Faker::Address.country
    end

    def faker_user_name
        Faker::Internet.user_name
    end

    def faker_password
        Faker::Internet.password(8)
    end

    def faker_email
        Faker::Internet.email
    end

    def faker_description
        Faker::WorldOfWarcraft.quote
    end

end