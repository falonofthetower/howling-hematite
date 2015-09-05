Fabricator(:giver) do
  id { Faker::Number.between(99,1000) }
  email { Faker::Internet.email }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip { Faker::Address.zip }
  message { Faker::Lorem.sentence }
end
