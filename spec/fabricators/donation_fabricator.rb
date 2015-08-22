Fabricator(:donation) do
  transaction_id { Faker::Number.number(10) }
  amount { Faker::Number.decimal(2) }
end
