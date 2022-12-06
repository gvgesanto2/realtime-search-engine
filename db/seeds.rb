password = "123123"

users = [
  User.create!(name: "John Doe", email: "john@test.com", password:),
  User.create!(name: "Jane Doe", email: "jane@test.com", password:)
]

users.each do |user|
  20.times do
    Article.create!(
      title: Faker::Movie.title,
      body: Faker::Lorem.paragraph_by_chars(number: 250),
      user:
    )
  end
end
