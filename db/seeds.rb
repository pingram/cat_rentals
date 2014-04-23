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