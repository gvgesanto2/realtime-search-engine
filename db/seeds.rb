john = User.create!(name: "John Doe", email: "john@test.com", password: "123123")

20.times do
  Article.create!(
    title: Faker::Movie.title,
    body: Faker::Lorem.paragraph_by_chars(number: 256),
    user: john
  )
end
