Fabricator(:giver) do
  id { Faker::Number.between(99,1000) }
  email { Faker::Internet.email }
  full_name { Faker::Name.name }
  message { Faker::Lorem.sentence }
end
