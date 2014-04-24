100.times do |i|
  birth_date = Date.new(2010, rand(12) + 1, rand(28)+1)
  Cat.create!(
                name: "Cat#{i}",
                birth_date: birth_date,
                age: (DateTime.now.year - birth_date.year),
                color: %w(black brown white tabby blue).sample,
                sex: %w(M F).sample
              )
end

cr1 = CatRentalRequest.create!(
                              cat_id: 1,
                              start_date: Date.new(2014, 1, 1),
                              end_date: Date.new(2015, 1, 1),
                              status: "PENDING"
)
cr2 = CatRentalRequest.create!(
                              cat_id: 2,
                              start_date: Date.new(2014, 2, 1),
                              end_date: Date.new(2015, 3, 1),
                              status: "PENDING"
)
cr3 = CatRentalRequest.create!(
                              cat_id: 1,
                              start_date: Date.new(2013, 2, 1),
                              end_date: Date.new(2013, 3, 1),
                              status: "PENDING"
)
cr4 = CatRentalRequest.create!(
                              cat_id: 1,
                              start_date: Date.new(2014, 2, 1),
                              end_date: Date.new(2014, 3, 1),
                              status: "PENDING"
)