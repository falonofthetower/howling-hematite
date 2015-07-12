Fabricator(:giver) do
  email { Faker::Internet.email }
  full_name { Faker::Name.name }
  message { Faker::Lorem.sentence }
end
