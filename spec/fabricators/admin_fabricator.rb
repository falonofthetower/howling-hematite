Fabricator(:admin) do
  username { Faker::Name.first_name }
  password 'abc123'
end
