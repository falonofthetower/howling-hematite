xml.instruct!
xml.donations do
  xml.total (@total.to_f - 5360.00).to_s
  xml.total_number_of_donors (@giver_count - 30)
end
