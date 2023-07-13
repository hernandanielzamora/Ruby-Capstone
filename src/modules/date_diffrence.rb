def input_date(date)
  years = 0
  loop do
    date = date.next_year
    break if Date.today < date

    years += 1
  end
  years
end
