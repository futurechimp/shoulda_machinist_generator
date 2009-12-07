require 'machinist/active_record'
require 'sham'
require 'faker'

# Shams - generated filler values
#

chars = ['A'..'Z', 'a'..'z'].map{|r|r.to_a}.flatten

Sham.define do
#  title            { Faker::Lorem.words }
#  person_name     { Faker::Name.name }
#  description     { Faker::Lorem.words }
#  # Make a fake username that passes validation
#  login           { Array.new(20).map{chars[rand(chars.size)]}.join  }
#  email           { Faker::Internet.email}
#  telephone       { Faker::PhoneNumber.phone_number}
#  client_id       { Faker::PhoneNumber.phone_number }
end



# Model class blueprints

