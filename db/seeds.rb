password = "123123"

users = [
  User.create!(name: "John Doe", email: "john@test.com", password:),
  User.create!(name: "Jane Doe", email: "jane@test.com", password:)
]

users.each do |user|
  25.times do
    Article.create!(
      title: Faker::Movie.unique.title,
      body: Faker::Lorem.paragraph_by_chars(number: 250),
      user:
    )
  end
end
